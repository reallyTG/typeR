library(island)


### Name: sss_cedp
### Title: MacKenzie etal (2003) likelihood approach for estimating
###   colonization/extinction parameters (with impecfect detectability)
### Aliases: sss_cedp
### Keywords: MacKenzie, colonization, extinction mle,

### ** Examples

Data1 <- lakshadweep[[1]]
Name_of_Factors <- c("Species","Atoll","Guild")
Factors <- Filter(is.factor, Data1)
No_of_Factors <- length(Factors[1,])
n <- No_of_Factors + 1
D1 <- as.matrix(Data1[1:nrow(Data1),n:ncol(Data1)])
Time <- as.double(D1[1,])
P1 <- as.matrix(D1[2:nrow(D1),1:ncol(D1)])
# Dealing with time.
Time_Vector <- as.numeric(names(table(Time)))
Transects   <- as.numeric((table(Time)))
R1 <- sss_cedp(P1, Time_Vector, Transects,
                       Colonization=0.5, Extinction=0.5, Detectability=0.5,
                       Phi_Time_0=0.5,
                       Tol=1.0e-8, Verbose = 1)



