library(rTableICC)


### Name: rTableICC.RxC
### Title: Randomly Generate RxC Contingency Tables over
###   Intraclass-Correlated Individuals
### Aliases: rTableICC.RxC
### Keywords: datagen contingency correlation intraclass Poisson
###   multinomial product

### ** Examples

# --- Generate a 2x3 contingency table under multinomial sampling plan ---
max.cluster.size=9                          # Maximum allowed cluster size
num.cluster=12                              # Total number of clusters 
ICCs=array(0.1,dim=max.cluster.size)        # Assign equal ICCs for this exmaple
ICCs[1]=0                                   # Assign zero ICC to clusters with 
                                            #  one individual 
sampl="Multinomial"                         # Generate table under multinomial 
                                            #  sampling plan
num.obs=24                                  # Number of observations to be 
                                            #  generated
cell.prob=array(1/6,dim=c(2,3))             # Cell probabilities sum up to one 
zeros=FALSE                                 # Do not allow zero sized clusters

x=rTableICC.RxC(p=cell.prob,theta=ICCs,M=num.cluster,sampling=sampl,
                 N=num.obs,zero.clusters=zeros,print.regular=TRUE,
                 print.raw=FALSE)
print(x) 

# --- Generate a 2x3 contingency table under product multinomial sampling plan ---
# --- with fixed row margins                                                   ---
sampl="Product"                             # Generate table under product 
                                            #  multinomial sampling plan
row=c(12,12)                                # Fixed row margins
cell.prob=array(0,dim=c(2,3))               # Cell probabilities sum up to one 
cell.prob[1,1:2]=0.2
cell.prob[1,3]=0.1
cell.prob[2,1:2]=0.1
cell.prob[2,3]=0.3                          # Marginal and cell probabilities 
                                            #  should be equal to each other

y1=rTableICC.RxC(p=cell.prob,theta=ICCs,row.margins=row,M=num.cluster,
                  sampling=sampl,print.regular=TRUE,print.raw=FALSE)
print(y1)

# --- Generate a 3x2 contingency table under product multinomial sampling plan ---
# --- with fixed cloumn margins                                                ---
col=c(12,12) 
cell.prob=array(0,dim=c(3,2))               # Cell probabilities sum up to one 
cell.prob[1:2,1]=0.2
cell.prob[1,2]=0.1
cell.prob[2,2]=0.1
cell.prob[3,1]=0.1
cell.prob[3,2]=0.3  

y2=rTableICC.RxC(p=cell.prob,theta=ICCs,col.margins=col,M=num.cluster,
                  sampling=sampl,print.regular=TRUE,print.raw=FALSE)
print(y2)

# --- Generate a 4x3 contingency table under Poisson sampling plan ---
sampl="Poisson"                             # Generate table under product 
                                            #  multinomial sampling plan
cell.prob=array(1/12,dim=c(4,3))            # Cell probabilities sum up to one 
cell.mean=array(4,dim=c(4,3))               # Define mean number of individuals 
                                            #  in each cell
max.cluster.size=19                         # Maximum allowed cluster size
ICCs=array(0.1,dim=max.cluster.size)        # Assign equal ICCs for this exmaple
ICCs[1]=0  

z=rTableICC.RxC(p=cell.prob,lambda=cell.mean,theta=ICCs,row.margins=row,
                 M=num.cluster,sampling=sampl,print.regular=TRUE,print.raw=FALSE)
print(z)




