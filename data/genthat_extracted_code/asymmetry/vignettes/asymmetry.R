## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
library(knitr)
knitr::opts_chunk$set(
   cache = FALSE,
   dpi = 75,
   fig.width = 6, fig.height = 6,
   fig.keep = 'high',
  # comment = "#>",
  tidy = FALSE)


## ----dataexample---------------------------------------------------------
library("asymmetry")
data("studentmigration")
idx <- c(3,4,25,27,31) #select five countries
studentmigration[idx,idx]

## ----example-------------------------------------------------------------
q1 <- skewsymmetry(studentmigration[idx,idx])
q1$A

## ----symm----------------------------------------------------------------
q1$S

## ----example2------------------------------------------------------------
summary(q1)

## ----clustering----------------------------------------------------------
clus <- hclust(as.dist(1/q1$S))
plot(clus,xlab=NA,sub=NA)

## ----linear--------------------------------------------------------------
   q1$linear

## ----example3, echo=TRUE-------------------------------------------------
library(RColorBrewer)
# creates a color palette from red to blue
my_palette <- colorRampPalette(c("red", "white", "blue"))(n = 299)
col_breaks = c(seq(-4000,-.001,length=100),  # negative values are red
  seq(-.001,0.01,length=100),                # zeroes are white
  seq(0.01,4000,length=100))                 # positive values are blue

hmap(q1, col = my_palette)

## ----example4------------------------------------------------------------
data(studentmigration)
idx <- c(18,22,27,2,13,31) #select 6 countries
q1 <- skewsymmetry(studentmigration[idx,idx])
q1$A


## ----studentmigration1 , fig.width = 8, fig.height = 8-------------------
# creates a color palette from red to blue
my_palette <- colorRampPalette(c("red", "white", "blue"))(n = 299)
col_breaks = c(seq(-4000,-.001,length=100),  # negative values are red
  seq(-.001,0.01,length=100),                # zeroes are white
  seq(0.01,4000,length=100))                 # positive values are blue
data(studentmigration)
hmap(studentmigration[idx,idx], dominance = FALSE, col = my_palette, key = FALSE, xlab = "Destination country", ylab = "Home country", colsep = c(1:6), rowsep = c(1:6))


## ----englishtowns, fig.width = 8, fig.height = 8-------------------------
data(Englishtowns)
v<-slidevector(Englishtowns, ndim = 2, itmax = 2500, eps = .0000001, verbose = FALSE)
plot(v,col="blue",ylim=c(-300,300),xlim=c(-300,300))


## ----englishtownsdecomp--------------------------------------------------

q2 <- skewsymmetry(v$resid)
summary(q2)


## ----migrationunique-----------------------------------------------------

data("studentmigration")
mm<-studentmigration
mm[mm==0]<-.5          # replace zeroes by a small number
mm <- -log(mm/sum(mm)) # convert similarities to dissimilarities
v<-mdsunique(mm, ndim = 2, itmax = 2100, verbose=FALSE, eps = .0000000001)
plot(v, yplus = .3, ylim = c(-4.5, 4), xlim = c(-4.5, 4))



