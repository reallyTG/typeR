library(lme4)


### Name: Dyestuff
### Title: Yield of dyestuff by batch
### Aliases: Dyestuff Dyestuff2
### Keywords: datasets

### ** Examples

## Don't show: 
 # useful for the lme4-authors --- development, debugging, etc:
 commandArgs()[-1]
 if(FALSE) ## R environment variables:
 local({ ne <- names(e <- Sys.getenv())
         list(R    = e[grep("^R", ne)],
              "_R" = e[grep("^_R",ne)]) })
 Sys.getenv("R_ENVIRON")
 Sys.getenv("R_PROFILE")
 cat("R_LIBS:\n"); (RL <- strsplit(Sys.getenv("R_LIBS"), ":")[[1]])
 nRL <- normalizePath(RL)
 cat("and extra(:= not in R_LIBS) .libPaths():\n")
 .libPaths()[is.na(match(.libPaths(), nRL))]

 structure(Sys.info()[c(4,5,1:3)], class="simple.list") #-> 'nodename' ..
 sessionInfo()
 searchpaths()
 pkgI <- function(pkgname) {
   pd <- tryCatch(packageDescription(pkgname),
                  error=function(e)e, warning=function(w)w)
   if(inherits(pd, "error") || inherits(pd, "warning"))
     cat(sprintf("packageDescription(\"%s\") %s: %s\n",
                 pkgname, class(pd)[2], pd$message))
   else
     cat(sprintf("%s -- built: %s\n%*s -- dir  : %s\n",
                 pkgname, pd$Built, nchar(pkgname), "",
                 dirname(dirname(attr(pd, "file")))))
 }
 pkgI("Matrix")
 pkgI("Rcpp")
 ## 2012-03-12{MM}: fails with --as-cran
 pkgI("RcppEigen")
 pkgI("minqa")
 pkgI("lme4")
## End(Don't show)
require(lattice)
str(Dyestuff)
dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff,
        ylab = "Batch", jitter.y = TRUE, aspect = 0.3,
        type = c("p", "a"))
dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff2,
        ylab = "Batch", jitter.y = TRUE, aspect = 0.3,
        type = c("p", "a"))
(fm1 <- lmer(Yield ~ 1|Batch, Dyestuff))
(fm2 <- lmer(Yield ~ 1|Batch, Dyestuff2))



