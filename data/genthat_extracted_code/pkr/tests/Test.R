require(pkr)

Equal = function(Wres, Rres, Tol=0.001)
{
  Wres[,"ID"] = as.character(Wres[,"Subject"])
  ColName0 = colnames(Rres)
  rownames(RptCfg) = RptCfg[,"PPTESTCD"]
  colnames(Rres) = c(ColName0[1], RptCfg[ColName0[-1],"WNL"])
  Inter = intersect(colnames(Wres), colnames(Rres))

  IsSame = TRUE
  for (i in 1:nrow(Wres)) {
    for (j in Inter) {
      R = as.numeric(Rres[i,j])
      W = as.numeric(Wres[i,j])
      if (W != 0) {
        if(abs((R - W)/W) > Tol) {
          print(Wres[i,j])
          print(Rres[i,j])
          IsSame = FALSE
        }
      }
    }
  }
  return(IsSame)
}

Theoph[,"Subject"] = as.numeric(as.character(Theoph[,"Subject"]))
Indometh[,"Subject"] = as.numeric(as.character(Indometh[,"Subject"]))

Wres = read.csv("Final_Parameters_Pivoted_Theoph_Linear.csv")
Rres = tblNCA(Theoph, "Subject", "Time", "conc", dose=320, concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Theoph_Log.csv")
Rres = tblNCA(Theoph, "Subject", "Time", "conc", dose=320, down="Log", concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Linear.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Log.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Bolus", down="Log", concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Linear_Infusion.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", dur=0.25, concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Log_Infusion.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, adm="Infusion", dur=0.25, down="Log", concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Linear_Wrong_Extravascular.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")

Wres = read.csv("Final_Parameters_Pivoted_Indometh_Log_Wrong_Extravascular.csv")
Rres = tblNCA(Indometh, "Subject", "time", "conc", dose=25, down="Log", concUnit="mg/L")
if (!Equal(Wres, Rres)) stop("Test Failed!")
