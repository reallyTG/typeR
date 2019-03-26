library(ipptoolbox)


### Name: propsens
### Title: Monte Carlo propagation and sensitivity analysis
### Aliases: dsevalmc dssensitivity dsbound dsmonotonous dsmonotonous2
###   dsopt

### ** Examples

print("Define monotonous function f1 and nonmonotonous function f2");
f1=(function(x){ z <- sqrt(abs(x[,1]+ 2*x[,2]));});
f2=(function(x){ z <- sin(x[,1]+ x[,2]);});
print("Create input BPAs x");
mu1=dsstruct(c(2,3,1));
mu2=dsstruct(c(4,4,1));
dss1=dsodf('qnorm',200,mu1);
dss2=dsodf('qnorm',500,mu2);
x=list(dss1,dss2)
correlations=0.5;
print("Propagate through f1 under independence assumption / correlation 0.5");
y_f1_independent=dsevalmc(f1,x,1000)
y_f1_dependent=dsevalmc(f1,x,1000,dsbound,correlations)
print("Propagate through f2 using optimization");

y_f2=dsevalmc(f2,x,1000,dsopt)
print("Plot results:");
dscdf(y_f1_independent[[1]])

dscdf(y_f1_dependent[[1]])

dscdf(y_f2[[1]])

print("Sensitivity on AW measure, inputs 1 & 2");
s=dssensitivity(x,c(1,2),f1,dsaggwidth,20,100,'distribution');
print(s)



