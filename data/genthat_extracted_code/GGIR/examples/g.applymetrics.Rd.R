library(GGIR)


### Name: g.applymetrics
### Title: Extract metrics from acceleration signals
### Aliases: g.applymetrics

### ** Examples

  Gx = runif(n=10000,min=0,max=2)
  Gy = runif(n=10000,min=1,max=3)
  Gz = runif(n=10000,min=0,max=2)
  metrics2do = data.frame(do.bfen=TRUE,do.enmo=TRUE,do.lfenmo=FALSE,
  do.en=FALSE,do.hfen=FALSE,do.hfenplus=FALSE,do.mad=FALSE,do.anglex=FALSE,
  do.angley=FALSE,do.anglez=FALSE,do.roll_med_acc_x=FALSE,
  do.roll_med_acc_y=FALSE,do.roll_med_acc_z=FALSE,
  do.dev_roll_med_acc_x=FALSE,do.dev_roll_med_acc_y=FALSE,
  do.dev_roll_med_acc_z=FALSE,do.enmoa=FALSE)
  extractedmetrics = g.applymetrics(Gx,Gy,Gz,n=4,sf=40,ws3=5,metrics2do)



