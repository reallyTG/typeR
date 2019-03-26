library(ARTP2)


### Name: meta
### Title: Single-marker meta-analysis
### Aliases: meta

### ** Examples


study1 <- system.file("extdata", package = "ARTP2", "study1.txt.gz")
study2 <- system.file("extdata", package = "ARTP2", "study2.txt.gz")
snps <- c('rs13266821', 'rs4824130', 'rs1792438', 'rs1000047', 
          'rs1000017', 'rs6066771', 'rs12508128')

m1 <- meta(summary.files = c(study1, study2), lambda = c(1.10, 1.08), 
           sel.snps = snps)
m2 <- meta(summary.files = c(study1, study2), lambda = c(1.10, 1.08), 
           sel.snps = snps, only.meta=FALSE)

m1$conf.snps

m1$meta.stat
m2$meta.stat




