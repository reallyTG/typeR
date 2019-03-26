library(OneArmPhaseTwoStudy)


### Name: get_r2_flex
### Title: Calculates the number of responses needed for the second stage.
### Aliases: get_r2_flex

### ** Examples

#Calculate a Simon's two-stage design
design <- getSolutions()$Solutions[3,] #minimax-design for the default values.
#Get the conditional error values using proportionally "rest"-alpha spending.
ce_df <- getD_proportionally(design, 0.05)
#Assume 5 responses were observed in the interim analysis.
ce <- ce_df[5+1,]$ce # conditional error for 5 responses is listed in the 6th row of "ce_df"
#Calculate the number of patients needed in the second stage.
n2 <- design$n - design$n1
r2 <- get_r2_flex(ce, design$p0, n2)
r2
#Assume 10 patients more should be recruited in the second stage.
#(This changes the number of needed responses.)
n2 <- n2 + 10
r2 <- get_r2_flex(ce, design$p0, n2)
r2



