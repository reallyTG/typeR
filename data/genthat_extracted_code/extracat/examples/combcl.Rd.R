library(extracat)


### Name: combcl
### Title: Combine categorical variables from cfluctile and cflcl
### Aliases: combcl

### ** Examples


a <- arsim(2000, c(12,17),5, noise=0.2,shuffle = FALSE)
cfa <- cfluctile(a)

da <- as.data.frame(a)
clusters <- cfcl( da, ll = cfa)

dev.new()
fluctile(xtabs(da$Freq~clusters[,1] + clusters[,2]))

table(combcl(clusters))




