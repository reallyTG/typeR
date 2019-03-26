## ----savefile------------------------------------------------------------
library("vtreat")
dTrainC <- data.frame(x=c('a','a','a','b','b',NA,NA),
                      z=c(1,2,3,4,NA,6,NA),
                      y=c(FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE))
treatmentsC <- designTreatmentsC(dTrainC, colnames(dTrainC),
                                 'y', TRUE,
                                 verbose= FALSE)

fileName = paste0(tempfile(c('vtreatPlan')), '.RDS')
saveRDS(treatmentsC,fileName)
rm(list=c('treatmentsC'))

## ----loadfile------------------------------------------------------------
library("vtreat")
treatmentsC <- readRDS(fileName)

dTestC <- data.frame(x=c('a','b','c',NA),z=c(10,20,30,NA))
dTestCTreated <- prepare(treatmentsC, dTestC, pruneSig= c())

# clean up
unlink(fileName)

## ----dbsave--------------------------------------------------------------
con <- NULL
if (requireNamespace('RSQLite', quietly = TRUE) &&
    requireNamespace('DBI', quietly = TRUE)) {
  library("RSQLite")
  con <- dbConnect(drv=SQLite(), dbname=":memory:")
  # create table
  dbExecute(con, 'create table if not exists treatments 
                 (key varchar(200) primary key, 
                  treatment blob)')
  # wrap data
  df <- data.frame(
    key='treatmentsC', 
    treatment = I(list(serialize(treatmentsC, NULL))))
  # Clear any previous version
  dbExecute(con, 
               "delete from treatments where key='treatmentsC'")
  # insert treatmentplan
  # depreciated
  # dbGetPreparedQuery(con,
  #                    'insert into treatments (key, treatment) values (:key, :treatment)',
  #                    bind.data=df)
  dbExecute(con, 
             'insert into treatments (key, treatment) values (:key, :treatment)',
             params=df)
  constr <- paste(capture.output(print(con)),collapse='\n')
  paste('saved to db: ', constr)
}
rm(list= c('treatmentsC', 'dTestCTreated'))

## ----dbload--------------------------------------------------------------
if(!is.null(con)) {
  treatmentsList <- lapply(
    dbGetQuery(con, 
               "select * from treatments where key='treatmentsC'")$treatment,
    unserialize)
  treatmentsC <- treatmentsList[[1]]
  dbDisconnect(con)
  dTestCTreated <- prepare(treatmentsC, dTestC, pruneSig= c())
  print(dTestCTreated)
}

