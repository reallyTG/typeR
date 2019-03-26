library(GameTheoryAllocation)


### Name: EPM_allocation
### Title: Equal Profit Method allocation
### Aliases: EPM_allocation
### Keywords: EPM EPM_allocation

### ** Examples

characteristic_function<-c(0,0.538, 0.761, 1.742, 0.554, 0.137, 0.293, 0.343)
EPM_allocation(characteristic_function,r=0.01,info=1,game="cost")
#[1] "EPM_allocation"
#[1] "The cost game has a non-empty core"
#     1     2     3
#  0.05 0.206 0.087



