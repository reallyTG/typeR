library(SIDES)


### Name: simulation_SIDES
### Title: Simulations of SIDES method
### Aliases: simulation_SIDES print.simulation_SIDES

### ** Examples

n=500
x=data.frame(matrix(rnorm(n*5,10,5),n,5),matrix(rbinom(n*5,1,0.5),n,5))
colnames(x)=paste("x",c(1:10),sep='')
rownames(x)=1:n
trt=rbinom(n,1,0.5)
I1=(x$x1>10);n1=sum(I1)
I6=(x$x6==0);n6=sum(I6)
I7=(x$x7==0);n7=sum(I7)
y=trt*(I1*(n-n1)-(1-I1)*n1+I6*(n-n6)-(1-I6)*n6+I7*(n-n7)-(1-I7)*n7)/n+rnorm(n)
data=cbind(y,trt,x)
head(data)

# DUMMY EXAMPLE TO RUN
s1 = simulation_SIDES(all_set=data[,c(1,2,8,9,10)], type_var=rep("ordinal",3), 
type_outcome="continuous", level_control=0, D=0, L=1, S=50, M=1, num_crit=1, 
gamma=c(1), alpha=0.05, nsim=1, ord.bin=10, nrep=1, seed=42,
H=2, pct_rand=1.0, prop_gpe=c(0.7,0.3), upper_best=TRUE, nb_cores=1)

# REAL EXAMPLES TO UNCOMMENT
#s1 = simulation_SIDES(all_set=data, 
#type_var=c(rep("continuous",5),rep("ordinal",5)), type_outcome="continuous",
#level_control=0, D=0, L=3, S=30, M=5, num_crit=1, gamma=c(1,1,1), alpha=0.10,
#nsim=1000, ord.bin=10, nrep=1000, seed=42, H=1, upper_best=TRUE)
#s1

#s1 = simulation_SIDES(all_set=data, 
#type_var=c(rep("continuous",5),rep("ordinal",5)), type_outcome="continuous",
#level_control=0, D=0, L=3, S=30, M=5, num_crit=1, gamma=c(1,1,1), alpha=0.10,
#nsim=1000, ord.bin=10, nrep=1000, seed=42, H=2, pct_rand=0.5,
#prop_gpe=c(0.7,0.3), upper_best=TRUE)
#s1



