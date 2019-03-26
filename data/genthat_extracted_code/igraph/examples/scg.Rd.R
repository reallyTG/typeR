library(igraph)


### Name: scg
### Title: All-in-one Function for the SCG of Matrices and Graphs
### Aliases: scg
### Keywords: graphs

### ** Examples



## We are not running these examples any more, because they
## take a long time (~20 seconds) to run and this is against the CRAN
## repository policy. Copy and paste them by hand to your R prompt if
## you want to run them.

## Not run: 
##D # SCG of a toy network
##D g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
##D g <- add_edges(g, c(1,6, 1,11, 6, 11))
##D cg <- scg(g, 1, 3, algo="exact_scg")
##D 
##D #plot the result
##D layout <- layout_with_kk(g)
##D nt <- vcount(cg$Xt)
##D col <- rainbow(nt)
##D vsize <- table(cg$groups)
##D ewidth <- round(E(cg$Xt)$weight,2)
##D 
##D op <- par(mfrow=c(1,2))
##D plot(g, vertex.color = col[cg$groups], vertex.size = 20,
##D 		vertex.label = NA, layout = layout)
##D plot(cg$Xt, edge.width = ewidth, edge.label = ewidth, 
##D 	vertex.color = col, vertex.size = 20*vsize/max(vsize),
##D 	vertex.label=NA, layout = layout_with_kk)
##D par(op)
##D 
##D ## SCG of real-world network
##D library(igraphdata)
##D data(immuno)
##D summary(immuno)
##D n <- vcount(immuno)
##D interv <- c(100,100,50,25,12,6,3,2,2)
##D cg <- scg(immuno, ev= n-(1:9), nt=interv, mtype="laplacian",
##D                         algo="interv", epairs=TRUE)
##D 
##D ## are the eigenvalues well-preserved?
##D gt <- cg$Xt
##D nt <- vcount(gt)
##D Lt <- laplacian_matrix(gt)
##D evalt <- eigen(Lt, only.values=TRUE)$values[nt-(1:9)]
##D res <- cbind(interv, cg$values, evalt)
##D res <- round(res,5)
##D colnames(res) <- c("interv","lambda_i","lambda_tilde_i")
##D rownames(res) <- c("N-1","N-2","N-3","N-4","N-5","N-6","N-7","N-8","N-9")
##D print(res)
##D 
##D ## use SCG to get the communities
##D com <- scg(laplacian_matrix(immuno), ev=n-c(1,2), nt=2)$groups
##D col <- rainbow(max(com))
##D layout <- layout_nicely(immuno)
##D 
##D plot(immuno, layout=layout, vertex.size=3, vertex.color=col[com],
##D                 vertex.label=NA)
##D 
##D ## display the coarse-grained graph
##D gt <- simplify(as.undirected(gt))
##D layout.cg <- layout_with_kk(gt)
##D com.cg <- scg(laplacian_matrix(gt), nt-c(1,2), 2)$groups
##D vsize <- sqrt(as.vector(table(cg$groups)))
##D 
##D op <- par(mfrow=c(1,2))
##D plot(immuno, layout=layout, vertex.size=3, vertex.color=col[com],
##D                 vertex.label=NA)
##D plot(gt, layout=layout.cg, vertex.size=15*vsize/max(vsize), 
##D                 vertex.color=col[com.cg],vertex.label=NA)
##D par(op)
##D 
## End(Not run)




