library(rTableICC)


### Name: rTableICC-package
### Title: Random Generation of R x C and 2 x 2 x K Contingency Tables
### Aliases: rTableICC-package
### Keywords: datagen, contingency, correlation, intraclass, Poisson,
###   multinomial, product

### ** Examples


# --- For more examples, please refer to specific functions ---

# --- Generate a random value from given probability function ---
p = c(0.23,0.11,0.05,0.03,0.31,0.03,0.22,0.02)
rDiscrete(n=2,pf=p)

# --- Generate a 2x2x4 contingency table under multinomial sampling plan with ICCs ---
num.centers=4                                # Number of centers
max.cluster.size=9                           # Maximum allowed cluster size
num.cluster=95                               # Total number of clusters under each  
                                             #  center is equal across the centers 
ICCs=array(0.1,dim=max.cluster.size)         # Assign equal ICCs for this exmaple
ICCs[1]=0                                    # Assign zero ICC to clusters with 
                                             #  one individual 
sampl="Multinomial"                          # Generate table under multinomial 
                                             #  sampling plan
num.obs=900                                  # Number of observations to be generated
cell.prob=array(0.0625,dim=c(num.centers,4)) # Cell probabilities sum up to one 

x=rTableICC.2x2xK(p=cell.prob,theta=ICCs,M=num.cluster,sampling=sampl,
                   N=num.obs,print.regular=TRUE,print.raw=FALSE)
print(x)       

# --- Generate a 2x3 contingency table under product multinomial sampling plan  ---
# --- with fixed row margins with ICCs                                          ---
max.cluster.size=9                           # Maximum allowed cluster size
num.cluster=12                               # Total number of clusters 
ICCs=array(0.1,dim=max.cluster.size)         # Assign equal ICCs for this exmaple
ICCs[1]=0                                    # Assign zero ICC to clusters with 
                                             #  one individual 
sampl="Product"                              # Generate table under product 
                                             #  multinomial sampling plan
row=c(12,12)                                 # Fixed row margins
cell.prob=array(0,dim=c(2,3))                # Cell probabilities sum up to one 
cell.prob[1,1:2]=0.2
cell.prob[1,3]=0.1
cell.prob[2,1:2]=0.1
cell.prob[2,3]=0.3                           # Marginal and cell probabilities 
                                             #  should match to each other

y=rTableICC.RxC(p=cell.prob,theta=ICCs,row.margins=row,M=num.cluster,
                 sampling=sampl,print.regular=TRUE,print.raw=FALSE)
print(y)

# --- Generate a 2x2x8 contingency table under Poisson sampling plan without ICC ---
num.centers=8                               # Number of centers
sampl="Poisson"                             # Generate table under Poisson 
                                            #  sampling plan
cell.mean=array(3,dim=c(2,2,num.centers))   # Enter mean number of individuals 
                                            #  in each cell

z=rTable.2x2xK(sampling=sampl,lambda=cell.mean)
print(z)

# --- Generate a 5x7 contingency table under multinomial sampling plan without ICC ---
num.row=5                                   # Number of rows
num.col=7                                   # Number of columns
sampl="Multinomial"                         # Generate table under multinomial 
                                            #  sampling plan
cell.prob=array(1/35,dim=c(num.row,num.col))# Enter cell probabilities in RxC 
                                            #  format 
num.obs=124                                 # Number of observations

u=rTable.RxC(p=cell.prob,sampling=sampl,N=num.obs)
print(u)




