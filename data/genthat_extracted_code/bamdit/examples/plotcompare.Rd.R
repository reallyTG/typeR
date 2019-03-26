library(bamdit)


### Name: plotcompare
### Title: plotcompare
### Aliases: plotcompare
### Keywords: file

### ** Examples


## execute analysis
## Not run: 
##D 
##D # Comparing results from two models same data
##D 
##D data(glas)
##D glas.t <- glas[glas$marker == "Telomerase", 1:4]
##D glas.m1 <- metadiag(glas.t)
##D glas.m2 <- metadiag(glas.t, re = "sm")
##D plotcompare(m1 = glas.m1, m2 = glas.m2)
##D 
##D 
##D 
##D # Comparing results from two models fitted to two subgroups of data:
##D # studies with retrospective design and studies with prospective design
##D 
##D  data(ct)
##D  gr <- with(ct, factor(design,
##D                        labels = c("Retrospective study", "Prospective study")))
##D 
##D m1.ct <- metadiag(ct[ct$design==1, 1:4]) # Restrospective studies
##D m2.ct <- metadiag(ct[ct$design==2, 1:4]) # Prospective studies
##D 
##D plotcompare(m1.ct, m2.ct,
##D            m1.name = "Retrospective design",
##D            m2.name = "Prospective design",
##D              group = gr,
##D           limits.x = c(0, 0.75), limits.y = c(0.65, 1))
## End(Not run)




