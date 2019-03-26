library(quantable)


### Name: multigroupVolcano
### Title: plot volcano given multiple conditions
### Aliases: multigroupVolcano

### ** Examples

data(multigroupFCDATA)
colnames(multigroupFCDATA)
multigroupVolcano(multigroupFCDATA,effect="logFC",
type="adj.P.Val",condition="Condition",colour="colour",label="Name" )



