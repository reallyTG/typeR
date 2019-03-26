# source("moninit")
 library("RCALI")


# Cubature: Example of the user guide:
param=list(input=2,verbose=FALSE,output=1,poly=c(66,66),
   method="cub", maxpts= rep(1.0e+8,2),
 reler= c(1.0e-4, 1.0e-3),
   dz=c(0,21), dp=c(100,0),  tz=c(0,1))

start.run <- Sys.time()
califlopp(file="data",
c(fpollen,fseed), param=param)
end.run <- Sys.time()
duration <- end.run - start.run
# print(duration)

# Grid: Example of the user guide:(too long)
# param=list(input=1, delim=" ", poly=c(66,66),
#   dz=c(0,21), dp=c(100,0),  tz=c(0,1), method="grid",
#   step=c(0.25, 0.25), nr=20)
# start.run <- Sys.time()
# califlopp(file="data",c(1,2), param=param)
# end.run <- Sys.time()
# duration <- end.run - start.run
# print(duration)


# Grid: Example of the Example chapter of the manual: (too long)
#param=list(input=1, delim=" ",  method="grid",
#  poly=list(c(1,1),c(14,14),c(11,12),c(56,57),c(4,4)), nr=5,
#  step=c(1,1))

#start.run <- Sys.time()
# califlopp(file="data", dispf=1,param=param)
#end.run <- Sys.time()
#duration <- end.run - start.run
# print(duration)


# Idem with R dispersion function: (too long)
# param=list(input=1, delim=" ",  method="grid",
#   poly=list(c(1,1),c(14,14),c(11,12),c(56,57),c(4,4)), nr=5,
#   step=c(1,1), dz=0, dp=100, tz=0)
# start.run <- Sys.time()
# califlopp(file="data", dispf=fpollen,param=param)
# end.run <- Sys.time()
# duration <- end.run - start.run
# print(duration)

