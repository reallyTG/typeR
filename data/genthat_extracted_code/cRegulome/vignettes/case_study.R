## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE, fig.align = 'center')

## ----load_libraries------------------------------------------------------
library(cRegulome)
library(readxl)
library(ggplot2)
library(RSQLite)
library(R.utils)
library(igraph)
library(AnnotationDbi)
library(org.Hs.eg.db)
library(clusterProfiler)

## ----paper_data----------------------------------------------------------
# list of transcription factors
if(!file.exists('tf.xlsx')) 
    download.file('https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4393113/bin/pone.0122882.s001.xlsx',
                  destfile = 'tf.xlsx', mode = 'wb')
tf <- read_excel('tf.xlsx', skip = 1)

# list of microRNAs
if(!file.exists('mir.xls')) 
    download.file('https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4393113/bin/pone.0122882.s003.xls',
                  destfile = 'mir.xls', mode = 'wb')
mir <- read_excel('mir.xls', skip = 1)

## ----first_few-----------------------------------------------------------
length(unique(tf$SOURCE)); unique(tf$SOURCE) # TFs
length(unique(mir$AccID)); head(unique(mir$AccID), 5) # microRNAs

## ----cRegulome_data, eval=FALSE------------------------------------------
#  # download the db file when using it for the first time
#  destfile = paste(tempdir(), 'cRegulome.db.gz', sep = '/')
#  if(!file.exists(destfile)) {
#      get_db(test = TRUE)
#  }
#  
#  # connect to the db file
#  db_file = paste(tempdir(), 'cRegulome.db', sep = '/')
#  conn <- dbConnect(SQLite(), db_file)

## ----load_testset, include=FALSE-----------------------------------------
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- dbConnect(SQLite(), fl)

## ----query_database------------------------------------------------------
# query the database
creg_tf <- get_tf(conn,
                  tf = unique(tf$SOURCE),
                  study = 'STES',
                  targets_only = TRUE)

creg_mir <- get_mir(conn,
                    mir = tolower(unique(mir$AccID)),
                    study = 'STES',
                    targets_only = TRUE)

## ----compare_numbers-----------------------------------------------------
length(unique(creg_mir$mirna_base) %in% unique(tolower(mir$AccID)))
length(unique(creg_tf$tf) %in% unique(tf$SOURCE))

## ----stes_tf-------------------------------------------------------------
# numbers of targets 
table(creg_tf$tf)

## ----TF_summary----------------------------------------------------------
# construct a cTF object and plot
ob_tf <- cTF(creg_tf)
cor_joy(ob_tf)
cor_upset(ob_tf)

## ----stes_microRNA-------------------------------------------------------
# numbers of targets 
table(creg_mir$mirna_base)

## ----microRNA_summary----------------------------------------------------
# construct a cmicroRNA object and plot
ob_mir <- cmicroRNA(creg_mir)
cor_joy(ob_mir)
cor_upset(ob_mir)

## ----custom_query--------------------------------------------------------
# query cRegulome to get high correlated targets
creg_tf <- get_tf(conn,
                  tf = unique(tf$SOURCE),
                  study = 'STES',
                  min_abs_cor = .3,
                  targets_only = TRUE)
creg_mir <- get_mir(conn,
                    mir = tolower(unique(mir$AccID)),
                    study = 'STES',
                    min_abs_cor = .3,
                    targets_only = TRUE)

## ----make_graph----------------------------------------------------------
# make two separate networks
p1 <- cor_igraph(cTF(creg_tf))
p2 <- cor_igraph(cmicroRNA(creg_mir))

# combine networks
p <- graph.union(p1, p2)

# combine attributes
V(p)$type[V(p)$name %in% unique(creg_tf$tf)] <- 'TF'
V(p)$type[V(p)$name %in% unique(creg_mir$mirna_base)] <- 'microRNA'
V(p)$type[is.na(V(p)$type)] <- 'gene'

V(p)$color <- c('lightgreen', 'blue', 'red')[factor(V(p)$type)]

V(p)$label <- ifelse(V(p)$type == 'gene', '', V(p)$name)

E(p)$weight_1[is.na(E(p)$weight_1)] <- E(p)$weight_2[!is.na(E(p)$weight_2)]

## ----node_degrees--------------------------------------------------------
par(mfrow=c(1,2))
deg <- degree(p)

# full network degrees
plot(density(deg), 
     main = 'Full network degrees')

# gene degrees
plot(density(deg[V(p)$type == 'gene']),
     main = 'Gene nodes degrees')

## ----plot_network, fig.height=10, fig.width=10---------------------------
# plot network
set.seed(123)
par(mfrow=c(1,1))
new_p <- delete.vertices(p, deg < 2)
deg <- degree(new_p)
plot(new_p,
     vertex.size = log2(deg)+1,
     vertex.label.dist = .3,
     vertex.label.cex   = .8,
     vertex.label = V(new_p)$label,
     edge.arrow.size = 0)

legend('bottomleft',
       legend = unique(V(new_p)$type),
       col = unique(V(new_p)$color),
       pch = 19)

## ----clusters, fig.width=12, fig.height=8--------------------------------
set.seed(123)
cfg <- cluster_fast_greedy(new_p, weights = E(new_p)$weight_1)
plot_dendrogram(cfg,
                labels = V(new_p)$label,
                mode = 'hclust',
                cex = .5)

## ----numbers_clusters----------------------------------------------------
clusters <- split(names(membership(cfg)),
                  as.numeric(membership(cfg)))
lengths(clusters)

## ----kegg_enrichment-----------------------------------------------------
# prepare entrez ids
entrez <- lapply(clusters, function(x) {
    ei <- AnnotationDbi::select(org.Hs.eg.db, x, 'ENTREZID', 'SYMBOL')$ENTREZID
    na.omit(ei)
})

# run kegg enrichment
comp_path <- compareCluster(entrez, fun = 'enrichKEGG', organism = 'hsa')
comp_path@compareClusterResult %>%
    ggplot(aes(x = Description, y = Count)) +
    geom_col() +
    facet_wrap(~Cluster, scales = 'free_y', ncol = 1) +
    coord_flip() +
    labs(x = '')

## ----clean, include=FALSE------------------------------------------------
unlink('./*.xls*')
dbDisconnect(conn)

