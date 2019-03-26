library(vcdExtra)


### Name: blogits
### Title: Bivariate Logits and Log Odds Ratio
### Aliases: blogits
### Keywords: manip

### ** Examples

data(Toxaemia)
tox.tab <- xtabs(Freq~class + smoke + hyper + urea, Toxaemia)

# reshape to 4-column matrix
toxaemia <- t(matrix(aperm(tox.tab), 4, 15))
colnames(toxaemia) <- c("hu", "hU", "Hu", "HU")
rowlabs <- expand.grid(smoke=c("0", "1-19", "20+"), class=factor(1:5))
toxaemia <- cbind(toxaemia, rowlabs)

# logits for H and U
logitsTox <- blogits(toxaemia[,4:1], add=0.5, colnames=c("logitH", "logitW"), row.vars=rowlabs)
logitsTox




