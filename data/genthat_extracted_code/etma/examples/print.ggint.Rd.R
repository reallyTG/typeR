library(etma)


### Name: print.ggint
### Title: Print Method for 'ggint' Objects
### Aliases: print.ggint

### ** Examples

#Following examples are complete examples.
#They need 20,000/200,000 learning time in step 1/step 2, respectively (default).
#Please note they need more than 15 mins, and one of example need about 3 hrs.
#The complete learning time is necessary in real data analysis.
#Please use default setting as following to analysis your data.
#
#Example 1 (Note: the computing time in this example is about 3 hrs)
#
#data(data.GST)
#ggint1=ETMA(case.GSTM1.0,case.GSTM1.1,ctrl.GSTM1.0,ctrl.GSTM1.1,
#                  case.GSTT1.0,case.GSTT1.1,ctrl.GSTT1.0,ctrl.GSTT1.1,
#                  data=data.GST,start.seed=1,show.detailed.plot=TRUE,show.p.matrix=TRUE)
#print(ggint1)
#
#Example 2 (Note: the computing time in this example is about 15 mins)
#
#data(data.PAH)
#ggint2=ETMA(case.CYP1A1.0,case.CYP1A1.1,ctrl.CYP1A1.0,ctrl.CYP1A1.1,
#                  case.GSTM1.0,case.GSTM1.1,ctrl.GSTM1.0,ctrl.GSTM1.1,
#                  data=data.PAH,start.seed=1,show.detailed.plot=TRUE,show.p.matrix=TRUE)
#
#print(ggint2)
#
#Example 3 (Note: the computing time in this example is about 15 mins)
#
#data(data.RAS)
#ggint3=ETMA(case.ACE.0,case.ACE.1,ctrl.ACE.0,ctrl.ACE.1,
#                  case.AGT.0,case.AGT.1,ctrl.AGT.0,ctrl.AGT.1,
#                  data=data.RAS,start.seed=1,show.detailed.plot=TRUE,show.p.matrix=TRUE)
#print(ggint3)



