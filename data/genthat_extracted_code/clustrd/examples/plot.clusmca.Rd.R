library(clustrd)


### Name: plot.clusmca
### Title: Plotting function for 'clusmca()' output.
### Aliases: plot.clusmca

### ** Examples

data("hsq")
#Cluster Correspondence Analysis with 3 clusters in 2 dimensions after 10 random starts
outclusMCA = clusmca(hsq[,1:8], 3, 2, nstart = 10)
#Save the ggplot2 scatterplot  
map = plot(outclusMCA)$map
#Customization (adding titles)
map + ggtitle(paste("Cluster CA plot of the hsq data: 3 clusters of sizes ", 
paste(outclusMCA$size, collapse = ", "),sep = "")) + 
xlab("Dim. 1") + ylab("Dim. 2") + 
theme(plot.title = element_text(size = 10, face = "bold", hjust = 0.5))

data("hsq")
#i-FCB with 4 clusters in 3 dimensions after 10 random starts
outclusMCA = clusmca(hsq[,1:8], 4, 3, method = "iFCB", nstart= 10)
#Scatterlot with the observations only (dimensions 1 and 3) 
#and cluster description plots showing the 20 largest std. residuals 
#(with the full distribution showing in subplots)
plot(outclusMCA, dim = c(1,3), what = c(TRUE, FALSE), cludesc = TRUE, 
subplot = TRUE)



