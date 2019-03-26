library(MultiplierDEA)


### Name: CrossEfficiency
### Title: Cross Efficiency Model
### Aliases: CrossEfficiency
### Keywords: DEA Multiplier DEA Model Cross Efficiency Single-Phase
###   Approach Weight restrictions Assurance Region Malevolent Benevolent
###   Two-Phase Approach

### ** Examples

#Example from Kenneth R. Baker: Optimization Modeling with Spreadsheets, Third Edition,p. 176,
#John Wiley and Sons, Inc.

dmu <- c("A", "B", "C", "D", "E", "F")
x <- data.frame(c(150,400,320,520,350,320),c(0.2,0.7,1.2,2.0,1.2,0.7))
rownames(x) <- dmu
colnames(x)[1] <- c("StartHours")
colnames(x)[2] <- c("Supplies")

y <- data.frame(c(14,14,42,28,19,14),c(3.5,21,10.5,42,25,15))
rownames(y) <- dmu
colnames(y)[1] <- c("Reimbursed")
colnames(y)[2] <- c("Private")

# Calculate the efficiency score
result <- CrossEfficiency(x,y,"crs", "input")
# Examine the cross efficiency score for DMUs
print(result$ce_ave)



