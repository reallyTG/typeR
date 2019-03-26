library(ade4)


### Name: plot.phylog
### Title: Plot phylogenies
### Aliases: plot.phylog radial.phylog enum.phylog
### Keywords: hplot

### ** Examples

data(newick.eg)
par(mfrow = c(3,2))
for(i in 1:6) plot(newick2phylog(newick.eg[[i]], FALSE),
 clea = 2, clabel.l = 3, cnod = 2.5)
par(mfrow = c(1,1))

## Not run: 
##D par(mfrow = c(1,2))
##D plot(newick2phylog(newick.eg[[11]], FALSE), clea = 1.5,
##D  clabel.l = 1.5, clabel.nod = 0.75, f = 0.8)
##D plot(newick2phylog(newick.eg[[10]], FALSE), clabel.l = 0,
##D  clea = 0, cn = 0, f = 1)
##D par(mfrow = c(1,1))
## End(Not run)

par(mfrow = c(2,2))
w7 <- newick2phylog("(((((1,2,3)b),(6)c),(4,5)d,7)f);")
plot(w7,clabel.l = 1.5, clabel.n = 1.5, f = 0.8, cle = 2,
 cnod = 3, sub = "(((((1,2,3)b),(6)c),(4,5)d,7)f);", csub = 2)
w <- NULL
w[1] <- "((((e1:4,e2:4)a:5,(e3:7,e4:7)b:2)c:2,e5:11)d:2,"
w[2] <- "((e6:5,e7:5)e:4,(e8:4,e9:4)f:5)g:4);"
plot(newick2phylog(w), f = 0.8, cnod = 2, cleav = 2, clabel.l = 2)

data(taxo.eg)
w <- taxo2phylog(as.taxo(taxo.eg[[1]]))
plot(w, clabel.lea = 1.25, clabel.n = 1.25, sub = "Taxonomy",
 csub = 3, f = 0.8, possub = "topleft")

provi.tre <- "(((a,b,c,d,e)A,(f,g,h)B)C)D;"
provi.phy <- newick2phylog(provi.tre)
plot(provi.phy, clabel.l = 2, clabel.n = 2, f = 0.8)
par(mfrow = c(1,1))

## Not run: 
##D par(mfrow = c(3,3))
##D for (j in 1:6) radial.phylog(newick2phylog(newick.eg[[j]],
##D  FALSE), clabel.l = 2, cnodes = 2)
##D radial.phylog(newick2phylog(newick.eg[[7]],FALSE), clabel.l = 2)
##D radial.phylog(newick2phylog(newick.eg[[8]],FALSE), clabel.l = 0,
##D  circle = 1.8)
##D radial.phylog(newick2phylog(newick.eg[[9]],FALSE), clabel.l = 1,
##D  clabel.n = 1, cle = 0, cnode = 1)
##D par(mfrow = c(1,1))
##D 
##D data(bsetal97)
##D bsetal.phy = taxo2phylog(as.taxo(bsetal97$taxo[,1:3]), FALSE)
##D radial.phylog(bsetal.phy, cnod = 1, clea = 1, clabel.l = 0.75,
##D  draw.box = TRUE, cir = 1.1)
##D par(mfrow = c(1,1))
## End(Not run)

## Not run: 
##D # plot all the possible representations of a phylogenetic tree
##D a <- "((a,b)A,(c,d,(e,f)B)C)D;"
##D wa <- newick2phylog(a)
##D wx <- enum.phylog(wa)
##D dim(wx)
##D 
##D par(mfrow = c(6,8))
##D fun <- function(x) {
##D     w  <-NULL
##D     lapply(x, function(y) w<<-paste(w,as.character(y),sep=""))
##D     plot(wa, x, clabel.n = 1.25, f = 0.75, clabel.l = 2,
##D      box = FALSE, cle = 1.5, sub = w, csub = 2)
##D     invisible()}
##D apply(wx,1,fun)
##D par(mfrow = c(1,1))
## End(Not run)




