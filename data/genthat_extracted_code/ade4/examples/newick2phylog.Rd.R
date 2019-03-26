library(ade4)


### Name: newick2phylog
### Title: Create phylogeny
### Aliases: newick2phylog hclust2phylog taxo2phylog newick2phylog.addtools
### Keywords: manip

### ** Examples


 w <- "((((,,),,(,)),),(,));"
 w.phy <- newick2phylog(w)
 print(w.phy)
 plot(w.phy)

## Not run: 
##D # newick2phylog
##D data(newick.eg)
##D radial.phylog(newick2phylog(newick.eg[[8]], FALSE), cnode = 1,
##D  clabel.l = 0.8)
##D 
##D w <- NULL
##D w[1] <- "(,((((((((((((((((,,(,(,))),),(((,(,)),(,)),),(,(,)),(,)),((((("
##D w[2] <- ",(,)),),),(,)),((((,((,),((,(,)),))),(,)),(,(,),,((,),(,)),)),("
##D w[3] <- "(((((,),),(,(,))),),(,)),(((,),),)))),((,,((,),)),(,)),((,),(,)"
##D w[4] <- ")),(((((((((,,),),,),),((,),)),(,),((,),)),),(((((,),),),((,),)"
##D w[5] <- "),(((,(,(,(,)))),(,)),(((,),(((((((,),),),,),(,)),(,)),)),((,)"
##D w[6] <- ",))))),(,((,),(,)),((,(,)),)))),((((,(,(,))),((,(,)),,((,(,)),)"
##D w[7] <- ",)),(((,),),(((,),),))),((,),))),((((((((((,,,,(,)),),((,),)),("
##D w[8] <- ",(,))),(((((((((,(,)),(,)),((((,((,),(,(,(,))))),((,),(,(,)))),"
##D w[9] <- "),((,),))),(((((((((,(,)),((,),(,))),),),),(((,((,),)),),((,((,"
##D w[10] <- "),)),)),(,)),(,(,(,)))),((((,(,)),(,)),(((,),(,)),(,),,(,))),(,"
##D w[11] <- "))),(,,,))),((((,),),),(((,(,(,))),((,),)),(,)))),(,)),),(,((,("
##D w[12] <- ",)),),(((,),),))),),(((,),),(,),(,(,))),(((,),(,)),((,),(,)))),"
##D w[13] <- "(((,),((,),)),(((((,,,,,),(,)),(,)),(,((,),))),))),(,(((((,(((("
##D w[14] <- ",(,)),),),)),),((,((,),((,((,),(,))),))),)),((((,),(((,),(,(,))"
##D w[15] <- "),)),),)),((,),)))),(((,((,,((,),)),)),),((,),))),((,),(,))),(("
##D w[16] <- ",),)),(((((,),((,(,)),(((,(,)),(,(((,),),))),))),(,),,),),),,(,"
##D w[17] <- ")),((((,),,),),((,,,),((,),((,),))))),((((((,(,)),,(,)),,(,),(,"
##D w[18] <- "),),(((((,(,(,),)),(((,),,),(,))),),),),,,((,),)),),)),(((((,),"
##D w[19] <- "(,(,)),),((,((,),),,),)),(((((((,),((((,,,),(,(,))),(((,(,)),),"
##D w[20] <- "(,))),)),),),),(,)),),),((,),))),((,),)),(((((((((((,),),(((((("
##D w[21] <- ",),),((,),)),(,)),),)),(,)),),((((((,),),(((,),),)),(,)),),(,))"
##D w[22] <- ",),),),),(,)),),((,),(,),,,)),(,(,(,)))),),(,)),),);"
##D phy1 <- newick2phylog(w,FALSE)
##D phy1
##D radial.phylog(phy1, clabel.l = 0, circle = 2.2, clea = 0.5,
##D  cnod = 0.5)
##D data(newick.eg)
##D radial.phylog(newick2phylog(newick.eg[[8]], FALSE), cnode = 1,
##D  clabel.l = 0.8)
##D 
##D # hclust2phylog
##D data(USArrests)
##D hc <- hclust(dist(USArrests), "ave")
##D par(mfrow = c(1,2))
##D plot(hc, hang = -1)
##D phy <- hclust2phylog(hc)
##D plot(phy, clabel.l = 0.75, clabel.n = 0.6, f = 0.75)
##D 
##D par(mfrow = c(1,1))
##D row.names(USArrests) 
##D names(phy$leaves) #WARNING not the same for two reasons
##D row.names(USArrests) <- gsub(" ","_",row.names(USArrests))
##D row.names(USArrests) 
##D names(phy$leaves) #WARNING not the same for one reason
##D USArrests <- USArrests[names(phy$leaves),]
##D row.names(USArrests) 
##D names(phy$leaves) #the same
##D table.phylog(data.frame(scalewt(USArrests)), phy, csi = 2.5,
##D  clabel.r = 0.75, f = 0.7)
##D 
##D #taxo2phylog
##D data(taxo.eg)
##D tax <- as.taxo(taxo.eg[[1]])
##D tax.phy <- taxo2phylog(as.taxo(taxo.eg[[1]]))
##D par(mfrow = c(1,2))
##D plot(tax.phy, clabel.l = 1.25, clabel.n = 1.25, f = 0.75)
##D plot(taxo2phylog(as.taxo(taxo.eg[[1]][sample(15),])),
##D  clabel.l = 1.25, clabel.n = 1.25, f = 0.75)
##D 
##D par(mfrow=c(1,1))
##D plot(taxo2phylog(as.taxo(taxo.eg[[2]])), clabel.l = 1,
##D  clabel.n = 0.75, f = 0.65)
## End(Not run)


