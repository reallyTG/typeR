library(Sleuth2)


### Name: case1002
### Title: The Energy Costs of Echolocation by Bats
### Aliases: case1002
### Keywords: datasets

### ** Examples

str(case1002)

plot(log(Energy)~log(Mass), case1002,
     pch = ifelse(Type=="echolocating bats", 19,
                  ifelse(Type=="non-echolocating birds", 21, 24)))

plot(Energy~Mass, case1002, log="xy",
     xlab = "Body Mass (g) (log scale)",
     ylab = "Energy Expenditure (W) (log scale)", 
     pch = ifelse(Type=="echolocating bats", 19,
                  ifelse(Type=="non-echolocating birds", 21, 24)))
legend(7, 50, pch=c(24, 21, 19),
     c("Non-echolocating bats", "Non-echolocating birds","Echolocating bats"))

library(lattice)
yticks <- c(1,2,5,10,20,50)
xticks <- c(10,20,50,100,200,500)
xyplot(Energy ~ Mass, case1002, groups=Type, 
       scales = list(log=TRUE, y=list(at=yticks), x=list(at=xticks)),
       ylab = "Energy Expenditure (W) (log scale)",
       xlab = "Body Mass (g) (log scale)", 
       auto.key = list(x = 0.2, y = 0.9, corner = c(0, 1), border = TRUE))



