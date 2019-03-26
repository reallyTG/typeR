## ----init, include=F-----------------------------------------------------
library(knitr)
opts_chunk$set(message=FALSE, warning=FALSE, eval=TRUE, echo=TRUE)

## ------------------------------------------------------------------------
library(outbreaks)
library(epicontacts)

## ------------------------------------------------------------------------
str(mers_korea_2015)

## ------------------------------------------------------------------------
colnames((mers_korea_2015$linelist))

## ------------------------------------------------------------------------
colnames((mers_korea_2015$contacts))

## ------------------------------------------------------------------------
merskor15 <- make_epicontacts(linelist = mers_korea_2015$linelist,
                              contacts = mers_korea_2015$contacts, 
                              directed = FALSE)
class(merskor15)
summary(merskor15)

## ------------------------------------------------------------------------
contacts_ids <- get_id(merskor15, "contacts")
head(contacts_ids, n = 10)

## ------------------------------------------------------------------------
length(get_id(merskor15, "common"))

## ------------------------------------------------------------------------
subset(merskor15, node_attribute = list("outcome" = "Dead", "sex" = "M"), 
       edge_attribute = list("exposure" = "Emergency room"))

## ------------------------------------------------------------------------
nodes <- c("SK_14","SK_145")                  
subset(merskor15, cluster_id = nodes)

## ------------------------------------------------------------------------
subset(merskor15, cs = 3)
subset(merskor15, cs_min = 10, cs_max = 100)

## ------------------------------------------------------------------------
plot(merskor15) 

## ------------------------------------------------------------------------
plot(merskor15, "place_infect", node_shape = "sex",
     shapes = c(M = "male", F = "female")) 

## ------------------------------------------------------------------------
graph3D(merskor15, node_color = "sex", g_title = "MERS Korea 2014")

## ------------------------------------------------------------------------
si <- get_pairwise(merskor15, "dt_onset")   
summary(si)
hist(si, col="grey", border="white", xlab="Days after symptoms",
     main="MERS Korea 2014\nSerial Interval")

## ------------------------------------------------------------------------
head(get_pairwise(merskor15, "sex"), n = 10)
get_pairwise(merskor15, "sex", f=table)
fisher.test(get_pairwise(merskor15, "sex", f=table)) 

## ---- get_clusters-------------------------------------------------------
x <- make_epicontacts(ebola_sim$linelist, ebola_sim$contacts,
                      id = "case_id", to = "case_id", from = "infector",
                      directed = TRUE)
x

clust <- get_clusters(x, output = "data.frame")
class(clust)
dim(clust)
table(clust$cluster_size)
barplot(table(clust$cluster_size),
        main = "Cluster size distribution",
	xlab = "Cluster size",
	ylab = "Frequency")


## ---- get_clusters2------------------------------------------------------

x <- get_clusters(x)
x_14 <- subset(x, cs = 14)
plot(x_14, "cluster_member")


## ------------------------------------------------------------------------
deg_both <- get_degree(merskor15, "both", only_linelist = TRUE)

## ------------------------------------------------------------------------
head(sort(deg_both, decreasing = TRUE), 10)

## ------------------------------------------------------------------------
mean(deg_both)

