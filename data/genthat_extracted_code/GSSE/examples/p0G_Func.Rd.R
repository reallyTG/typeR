library(GSSE)


### Name: p0G_Func
### Title: Probability Calculation of Relative's Mutation Status
### Aliases: p0G_Func

### ** Examples


#  Example 1  #

 data("p0G_data");
 attach(p0G_data);

 n = dim(p0G_data)[1];
 Status = as.numeric( proband_pd == "Yes" );
 Relative = rep(1, n) + 1*(relative == "Sibling") + 2*(relative == "Child");

 detach(p0G_data);

 p0G = rep(0, n);

 for(i in 1:n)
 {
  p0G[i] = p0G_Func(p = 0.02, status = Status[i], relative = Relative[i], model="dominant");
 }

 data.frame(pd_status = Status, relatives = Relative, prob = p0G);

#  Example 2  #

 n = 50;
 status = sample(x=c(0,1), size = n, replace = TRUE, prob = c(0.6, 0.4) );
 relative = sample(x=1:3, size = n, replace = TRUE, prob = c(1/3, 1/3, 1/3) );

 p0G = rep(0, n);

 for(i in 1:n)
 {
  p0G[i] = p0G_Func(p = 0.2, status = status[i], relative = relative[i], model="dominant");
 }

 data.frame(status = status, relative = relative, p0G = p0G);




