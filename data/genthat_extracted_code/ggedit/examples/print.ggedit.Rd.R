library(ggedit)


### Name: print.ggedit
### Title: Print ggedit objects
### Aliases: print.ggedit

### ** Examples

p <- as.gglist(pList[1:2])
p

p1 <- p+geom_hline(aes(yintercept=3))
p1

print(p1,byrow=TRUE)

print(p1,layout = matrix(c(2,2,NA,1),ncol=2))




