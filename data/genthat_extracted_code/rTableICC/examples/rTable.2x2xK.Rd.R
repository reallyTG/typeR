library(rTableICC)


### Name: rTable.2x2xK
### Title: Randomly Generate 2x2xK Contingency Tables
### Aliases: rTable.2x2xK
### Keywords: datagen contingency Poisson multinomial product

### ** Examples

# --- Generate a 2x2x8 contingency table under multinomial sampling plan ---
num.centers=8                                   # Number of centers
sampl="Multinomial"                             # Generate table under multinomial 
                                                #  sampling plan
cell.prob=array(0.03125,dim=c(2,2,num.centers)) # Enter cell probabilities in 2x2xK format 
num.obs=124                                     # Number of observations

x=rTable.2x2xK(p=cell.prob,sampling=sampl,N=num.obs)
print(x)

# --- Generate a 2x2x8 contingency table under product multinomial sampling plan ---
sampl="Product"                                 # Generate table under product 
                                                #  multinomial sampling plan
center.margins=array(10,num.centers)            # Enter center margins 

y=rTable.2x2xK(p=cell.prob,sampling=sampl,N=center.margins)
print(y)

# --- Generate a 2x2x8 contingency table under Poisson sampling plan ---
num.centers=3
sampl="Poisson"                                 # Generate table under Poisson 
                                                #  sampling plan
cell.mean=array(3,dim=c(2,2,num.centers))       # Enter mean number of individuals 
                                                #  in each cell

z=rTable.2x2xK(sampling=sampl,lambda=cell.mean)
print(z)



