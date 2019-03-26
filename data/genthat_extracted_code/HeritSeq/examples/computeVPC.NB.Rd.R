library(HeritSeq)


### Name: computeVPC.NB
### Title: Calculate the negative binomial (NB) variance partition
###   coefficient (VPC) for one or more features.
### Aliases: computeVPC.NB

### ** Examples

## Compute VPC for each feature under negative binomial mixed model.
vpc.nb <- computeVPC.NB(para_nb)

## Visulize the distribution of the VPCs. 
hist(vpc.nb, breaks = 50, col = "cyan")

## Plot sorted VPCs.
plot(sort(vpc.nb), ylab = "Heritability (h2)", ylim = c(0,1), 
main = "Sorted NB VPC scores")
abline(h = 0.9, lty = 2, col = "red")
text(50, 0.92, "h2 = 0.9", col = "red")



