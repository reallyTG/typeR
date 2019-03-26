library(rTableICC)


### Name: rTableICC.2x2xK
### Title: Randomly Generate 2x2xK Contingency Tables over
###   Intraclass-Correlated Individuals
### Aliases: rTableICC.2x2xK
### Keywords: datagen contingency correlation intraclass Poisson
###   multinomial product

### ** Examples


# --- Generate a 2x2x4 contingency table under multinomial sampling plan ---
num.centers=4                                # Number of centers
max.cluster.size=9                           # Maximum allowed cluster size
num.cluster=95                               # Total number of clusters under 
                                             #  centers each center is equal across the  
ICCs=array(0.1,dim=max.cluster.size)         # Assign equal ICCs for this exmaple
ICCs[1]=0                                    # Assign zero ICC to clusters with 
                                             #  one individual 
sampl="Multinomial"                          # Generate table under multinomial 
                                             #  sampling plan
num.obs=900                                  # Number of observations to be 
                                             #  generated
cell.prob=array(0.0625,dim=c(num.centers,4)) # Cell probabilities sum up to one 

zeros=FALSE                                  # Do not allow zero sized clusters

x=rTableICC.2x2xK(p=cell.prob,theta=ICCs,M=num.cluster,sampling=sampl,zero.clusters=zeros,
                   N=num.obs,print.regular=TRUE,print.raw=FALSE)
print(x)                          

# --- Generate a 2x2x4 contingency table under product multinomial sampling plan ---

sampl="Product"                              # Generate table under product 
                                             #  multinomial sampling plan
num.obs=c(200,200,200,200)                   # Number of observations to be generated 
                                             #  under each center
cell.prob=array(0.0625,dim=c(num.centers,4)) # Cell probabilities sum up to one 
zeros=FALSE                                  # Do not allow zero sized clusters

y=rTableICC.2x2xK(p=cell.prob,theta=ICCs,M=num.cluster,sampling=sampl,
                  zero.clusters=zeros,N=num.obs,print.regular=TRUE,print.raw=FALSE)
print(y)

# --- Generate a 2x2x4 contingency table under Poisson sampling plan ---

sampl="Poisson"                              # Generate table under Poisson 
                                             #  sampling plan
cell.mean=2                                  # Assign equal mean number of 
                                             #  individual to all cells
cell.prob=array(0.0625,dim=c(num.centers,4)) # Cell probabilities sum up 
                                             #  to one 

z1=rTableICC.2x2xK(p=cell.prob,lambda=cell.mean,theta=ICCs,M=num.cluster,
                    sampling=sampl,N=num.obs,print.regular=TRUE,print.raw=FALSE)
print(z1)

cell.mean=c(2,3,3,2)                         # Assign equal mean number of individual 
                                             #  to cells under each center
max.cluster.size=19                          # Maximum allowed cluster size
ICCs=array(0.1,dim=max.cluster.size)         # Assign equal ICCs for this exmaple
ICCs[1]=0                                    # Assign zero ICC to clusters with one 
                                             #  individual

z2=rTableICC.2x2xK(p=cell.prob,lambda=cell.mean,theta=ICCs,M=num.cluster,
                    sampling=sampl,N=num.obs,print.regular=TRUE,print.raw=FALSE)
print(z2)



