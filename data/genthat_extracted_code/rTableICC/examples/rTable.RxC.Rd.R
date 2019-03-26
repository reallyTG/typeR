library(rTableICC)


### Name: rTable.RxC
### Title: Randomly Generate R x C Contingency Tables
### Aliases: rTable.RxC
### Keywords: datagen contingency Poisson multinomial product

### ** Examples

# --- Generate a 5x7 contingency table under multinomial sampling plan ---
num.row=5                                       # Number of rows
num.col=7                                       # Number of columns
sampl="Multinomial"                             # Generate table under 
                                                #  multinomial sampling plan
cell.prob=array(1/35,dim=c(num.row,num.col))    # Enter cell probabilities 
                                                #  in RxC format 
num.obs=124                                     # Number of observations

x=rTable.RxC(p=cell.prob,sampling=sampl,N=num.obs)
print(x)

# --- Generate a 3x3 contingency table under product multinomial sampling plan  ---
# --- with fixed row margins                                                    ---
num.row=3                                       # Number of rows
num.col=3                                       # Number of columns
row=c(32,12,11)                                 # Fixed row counts
sampl="Product"                                 # Generate table under product 
                                                #  multinomial sampling plan
cell.prob=array(0,dim=c(num.row,num.col))       # Enter cell probabilities in RxC format 
cell.prob[1,1]=0.12
cell.prob[1,2]=0.24
cell.prob[1,3]=32/55-0.36
cell.prob[2,1]=0.07
cell.prob[2,2]=0.1
cell.prob[2,3]=12/55-0.17
cell.prob[3,1]=0.05
cell.prob[3,2]=0.10
cell.prob[3,3]=11/55-0.15                       # Marginal and cell probabilities  
                                                #  should be equal to each other

y1=rTable.RxC(p=cell.prob,sampling=sampl,row.margins=row)
print(y1)

# --- Generate a 3x3 contingency table under product multinomial sampling plan ---
# --- with fixed row margins                                                   ---
num.row=3                                       # Number of rows
num.col=3                                       # Number of columns
col=c(5,5,10)                                   # Fixed row counts
sampl="Product"                                 # Generate table under product 
                                                #  multinomial sampling plan
cell.prob=array(0,dim=c(num.row,num.col))       # Enter cell probabilities in RxC format 
cell.prob[1,1]=0.1
cell.prob[1,2]=0.1
cell.prob[1,3]=0.05
cell.prob[2,1]=0.05
cell.prob[2,2]=0.1
cell.prob[2,3]=0.1
cell.prob[3,1]=0.3
cell.prob[3,2]=0.1
cell.prob[3,3]=0.1                             # Marginal and cell probabilities 
                                               #  should be equal to each other

y2=rTable.RxC(p=cell.prob,sampling=sampl,col.margins=col)
print(y2)

# --- Generate a 6x4 contingency table under Poisson sampling plan ---
num.row=6                                       # Number of rows
num.col=4                                       # Number of columns
sampl="Poisson"                                 # Generate table under Poisson 
                                                #  sampling plan
cell.mean=array(3,dim=c(6,4))                   # Enter mean number of individuals 
                                                #  in each cell

z=rTable.RxC(lambda=cell.mean,sampling=sampl)
print(z)




