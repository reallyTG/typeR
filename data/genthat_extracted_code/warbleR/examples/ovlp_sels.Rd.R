library(warbleR)


### Name: ovlp_sels
### Title: Find overlapping selections
### Aliases: ovlp_sels

### ** Examples

{
#no overlap
ovlp_sels(X =  selec.table)

# modified selec.table to make the first and second selection overlap
Y <- selec.table
Y$end[4] <- 1.5
  
 ovlp_sels(X =  Y)

# drop overlapping
 ovlp_sels(X =  Y, drop = TRUE)

# get index instead
 ovlp_sels(X =  Y, index = TRUE)
}



