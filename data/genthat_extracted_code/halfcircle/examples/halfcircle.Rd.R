library(halfcircle)


### Name: halfcircle
### Title: Visualization method for flow data using halfcircle diagram
### Aliases: halfcircle

### ** Examples

# load flow data
data(ex_flow)
flow <- ex_flow[,c(1,2,3)] # select veget column as volume
flow <- subset(flow,flow$vegetable>5000)
data(ex_node) # load node data
node <- ex_node[c(order(-ex_node$gdpc)),] # sort nodes in descending order of gdpc values
halfcircle(flow, node, dir="vertical", circle.col="gray", flow.col="black",label=NULL)

# legend
max <- max(flow[,c(3)]); median <- median(flow[,c(3)]); min <- min(flow[,c(3)])
max_w <- 10; median_w <- round(10*median/max); min_w <- round(10*min/max)
legend(x=-1.2, y=-0.8, legend=c(paste(round(max)), paste(round(median)), paste(round(min))),
    lty=1, lwd=c(max_w, median_w, min_w), cex=0.7)

# customize colors
node$color <- c("#22abcb","#4eb6ad","#86c388","#adcd6c","#dad84f")[node$income_level]
flow2 <- data.frame(flow, node[match(flow[,"O"], node[,"country"]),])
halfcircle(flow2, node, dir="vertical", flow.col=flow2$color, node.color=node$color, label=NULL)

# highlight one node
flow3 <- flow
flow3$color <- "gray"
flow3$color[flow3$O=="China"|flow3$D=="China"] <- "blue"
flow3 <- flow3[c(order(flow3$color,decreasing=TRUE)),]
node$label <- ""
node$label[node$country=="China"] <- "China"
halfcircle(flow3, node, dir="vertical", flow.col=flow3$color, label=node$label, label.size=0.7)



