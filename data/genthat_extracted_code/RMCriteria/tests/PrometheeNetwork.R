library(RMCriteria)
dados<-matrix(c(5.2,-3.5,
                4.3,-1.2,
                6.7,-2.0),byrow = T, ncol=2,nrow=3)

parms<-matrix(c(NA,
                NA),byrow=TRUE,ncol=1,nrow=2)

#RMCriteria::PrometheeI(dados,c(0.3,0.7),c(0,0),parms,FALSE)

#Step 1: Construct the RPrometheeArguments
PromObj <- RPrometheeConstructor(datMat=dados,vecWeights=c(0.3,0.7),vecMaximiz=c(F,T),prefFunction=c(0,0),parms=parms,normalize=FALSE)
res <- RPrometheeI(PromObj)
str(res)


# library(ggnetwork)
# library(network)
#
# #Step 1: Create the edges
# #Step 1.1: Find the rank
# rank<-data.frame("Phi"=res@PhiPlus-res@PhiMinus,"Phi.Plus"=res@PhiPlus,
#                  "Phi.Minus"= res@PhiMinus,"Alternative"=seq(1,length(res@PhiPlus)))
# #Step 1.2: Order data
# rank <- rank[order(-rank$Phi),]
#
# #Step 1.3: Defining the eges
# adjMatrix<-matrix(0,ncol=nrow(rank),nrow=nrow(rank))
# invisible(capture.output(for(row1 in 1:(nrow(rank)-1)){
#   for(row2 in (row1+1):nrow(rank)){
#     print(paste(row1,row2))
#     if(rank[row1,"Phi.Plus"]>rank[row2,"Phi.Minus"] & rank[row1,"Phi.Minus"]<rank[row2,"Phi.Minus"]){
#       adjMatrix[row1,row2]<-1
#     }
#   }
# }))
#
# #Step 1.4: Create the network
# net <- as.network(x = adjMatrix,
#                   directed = TRUE,
#                   loops = FALSE,
#                   matrix.type =    "adjacency")
#
# #Naming the vertices
# network.vertex.names(net) <- rank$Alternative
#
# #Tipos de redes
# net1<-ggnetwork(net)
# net2<-ggnetwork(net, layout = "fruchtermanreingold", cell.jitter = 0.75)
# net3<-ggnetwork(net, layout = "target", niter = 100)
#
#
# ggplot(net, aes(x = x, y = y, xend = xend, yend = yend)) +
#   geom_edges(arrow = arrow(length = unit(6, "pt"), type = "closed")) +
#   geom_nodes(color = "turquoise4", size = 10) +
#   geom_nodetext(aes(label =  vertex.names),
#                 fontface = "bold", color = "white") +
#   theme_blank()
#
#
# ggplot(net, aes(x = x, y = y, xend = xend, yend = yend)) +
#   geom_edges(arrow = arrow(length = unit(6, "pt"), type = "closed")) +
#   geom_nodes(color = "turquoise4") +
#   geom_nodelabel(aes(label =  vertex.names), size=4,  fontface = "bold") +
#   theme_blank()
#
# #Mais exemplos https://briatte.github.io/ggnetwork/
