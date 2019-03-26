library(Inventorymodel)


### Name: SOC
### Title: SOC
### Aliases: SOC

### ** Examples

SOC(n=3,a=600,d=c(500,300,400),h=c(9.6,11,10),m=NA,r=NA,b=NA,model="EOQ")

#EOQ model
#$`Share the ordering costs rule (individually)`
#[1] 2400.000 1989.975 2190.890

SOC(n=3,a=600,d=c(500,300,400),h=c(9.6,11,10),m=NA,r=NA,b=NA,model="EOQ")

#EOQ model
#$`Share the ordering costs rule (individually)`
#         1        2        3
#     0.000    0.000    0.000
#  2400.000    0.000    0.000
#     0.000 1989.975    0.000
#     0.000    0.000 2190.890
#  1847.521 1270.171    0.000
#  1772.517    0.000 1477.098
#     0.000 1337.960 1621.770
#  1511.608 1039.230 1259.673



