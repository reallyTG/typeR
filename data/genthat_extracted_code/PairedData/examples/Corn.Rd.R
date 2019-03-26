library(PairedData)


### Name: Corn
### Title: Corn data (Darwin)
### Aliases: Corn
### Keywords: datasets

### ** Examples

data(Corn)

# Visualizing two outliers
with(Corn,slidingchart(paired(Crossed,Self)))

# Very bad matching in these data
with(Corn,cor.test(Crossed,Self))
with(Corn,winsor.cor.test(Crossed,Self))


# So the two-sample test is slightly 
# more interesting than the paired test
with(Corn,t.test(Crossed,Self,var.equal=TRUE))
with(Corn,t.test(Crossed,Self,paired=TRUE))

# The Pitman-Morgan test is influenced by the two outliers
with(Corn,Var.test(paired(Crossed,Self)))
with(Corn,grambsch.Var.test(paired(Crossed,Self)))
with(Corn,bonettseier.Var.test(paired(Crossed,Self)))

# Lastly, is there a pot effect?
with(Corn,plot(paired(Crossed,Self)))
with(Corn,plot(paired(Crossed,Self),group=pot))



