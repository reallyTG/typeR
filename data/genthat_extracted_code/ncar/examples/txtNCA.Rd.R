library(ncar)


### Name: txtNCA
### Title: Text output of NCA for one subject
### Aliases: txtNCA
### Keywords: Output Form

### ** Examples

# For one subject
txtNCA(Theoph[Theoph$Subject=="1","Time"], Theoph[Theoph$Subject=="1","conc"], 
       dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")

# or equivalently
x = Theoph[Theoph$Subject=="1","Time"]
y = Theoph[Theoph$Subject=="1","conc"]
txtNCA(x, y, dose=320, doseUnit="mg", concUnit="mg/L", timeUnit="h")

# For all subjects
IDs = sort(as.numeric(unique(Theoph[,"Subject"])))
nID = length(IDs)
Res = vector()
for (i in 1:nID) {
  tRes = txtNCA(Theoph[Theoph[,"Subject"]==IDs[i],"Time"], 
                Theoph[Theoph[,"Subject"]==IDs[i],"conc"], 
                dose=320, concUnit="mg/L")
  tRes = c(paste("ID =", IDs[i]), tRes, "")
  Res = c(Res, tRes)
}
Res



