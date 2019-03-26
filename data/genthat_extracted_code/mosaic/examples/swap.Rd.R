library(mosaic)


### Name: swap
### Title: Swap values among columns of a data frame
### Aliases: swap

### ** Examples

if (require(tidyr)) {
  Sleep2 <- sleep %>% spread( key=group, val=extra )
  names(Sleep2) <- c("subject", "drug1", "drug2")
  swap(Sleep2, drug1 ~ drug2)
  mean( ~(drug1 - drug2), data=Sleep2)
  do(3) * mean( ~(drug1 - drug2), data=Sleep2 %>% swap(drug1 ~ drug2) ) 
} 



