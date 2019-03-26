library(HeritSeq)


### Name: computeVPC.CP
### Title: Calculate the compound Poisson (CP) variance partition
###   coefficient (VPC) for one or more features.
### Aliases: computeVPC.CP

### ** Examples

## Compute VPC for each feature under compound Poisson mixed models. 
vpc.cp <- computeVPC.CP(para_cp) 

## Visulize the distribution of the VPCs. 
hist(vpc.cp, breaks = 50, col = "cyan")

## Plot sorted VPCs.
plot(sort(vpc.cp), ylab = "Heritability (h2)", ylim = c(0,1), main = "Sorted CP VPC scores")
abline(h = 0.9, lty = 2, col = "red")
text(50, 0.92, "h2 = 0.9", col = "red")



