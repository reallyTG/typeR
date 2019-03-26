context("Testing missing data replacement options")

# set up

# simulate UV and MV data
set.seed(1)
simUVgauss1<-simUVgauss2<-simUVgauss3<- c(rnorm(n=20, mean=30), rnorm(n=20, mean=600), rnorm(n=33, mean=20), rnorm(n=33, mean=200))
set.seed(1)
simUVpoiss1<- simUVpoiss2<-simUVpoiss3<-c(rpois(n=20, lambda = 30), rpois(n=20, lambda = 600), rpois(n=33, lambda = 20), rpois(n=33, lambda = 200))

# remove 10% of points at random
numremoved<- 0.1*length(simUVgauss1)
set.seed(1)
removeIndices1<- sample.int(length(simUVgauss1), round(numremoved)) # chose indices to be NA
set.seed(2)
removeIndices2<- sample.int(length(simUVgauss1), round(numremoved))
set.seed(3)
removeIndices3<- sample.int(length(simUVgauss1), round(numremoved))

# replace points at indices with 0s
simUVgauss1[removeIndices1]<- NA
simUVpoiss1[removeIndices1]<- NA
simUVgauss2[removeIndices2]<- NA
simUVpoiss2[removeIndices2]<- NA
simUVgauss3[removeIndices3]<- NA
simUVpoiss3[removeIndices3]<- NA

sim3Vgauss<- cbind(simUVgauss1+10, simUVgauss2, simUVgauss3+90)
sim3Vpoiss<- cbind(simUVpoiss1, simUVpoiss2, simUVpoiss3)
sim3Vmix <- cbind(sim3Vpoiss, sim3Vgauss)


# store true correct answers
trueCPs<- c(1, 21, 41, 74)
#findCPres<- c(20)

# set up distribution params to use for UV and MV, gauss and poiss
pmUVg<- list("g")
pmUVp<- list("p")
pmMVg<- list("g", "g", "g")
pmMVp<- list("p", "p", "p")
pmMVm<- list("p", "p", "p", "g", "g", "g")

init_paramsUVg=list(list(m=0, k=0.01, a=0.01, b=0.0001))
init_paramsUVp=list(list(a=1, b=1))
init_paramsMVg=rep(list(list(m=0, k=0.01, a=0.01, b=0.0001)), 3)
init_paramsMVp=rep(list(list(a=1, b=1)), 3)
init_paramsMVm=c(init_paramsMVp, init_paramsMVg)

# make list of params realted to different input data:
mvp<-NULL
uvg<-list(datapts= simUVgauss1, probModel= pmUVg, init_params = init_paramsUVg, multivariate=FALSE)
uvp<-list(datapts= simUVpoiss1, probModel= pmUVp, init_params = init_paramsUVp, multivariate=FALSE)
mvg<-list(datapts= sim3Vgauss, probModel= pmMVg, init_params = init_paramsMVg, multivariate=TRUE)
mvp<-list(datapts= sim3Vpoiss, probModel= pmMVp, init_params = init_paramsMVp, multivariate=TRUE)
mvm<-list(datapts= sim3Vmix, probModel= pmMVm, init_params = init_paramsMVm, multivariate=TRUE)
data_params<-NULL
data_params<- list(uvg, uvp, mvg, mvp, mvm)

# get valid combos of options to test
#truncRlim =0, minRlength= 1, maxRlength= 10^4, minsep=1, maxsep=500, fuzzwindow=0,
#function(x, lambda){const_hazard(x, lambda=100)}

opts1<- list(truncRlim =10^(-3), minRlength= 2, maxRlength= 10^4, minsep=3, missPts = "mean",
             maxsep=100, hazard_func= function(x, lambda){const_hazard(x, lambda=200)})
opts2<- list(truncRlim =10^(-3), minRlength= 2, maxRlength= 10^4, minsep=3, missPts = "skip",
             maxsep=100, hazard_func= function(x, lambda){const_hazard(x, lambda=200)})
opts3<- list(truncRlim =10^(-3), minRlength= 2, maxRlength= 10^4, minsep=3, missPts = "prev",
             maxsep=100, hazard_func= function(x, lambda){const_hazard(x, lambda=200)})
opts4<- list(truncRlim =10^(-3), minRlength= 2, maxRlength= 10^4, minsep=3, missPts = 0,
             maxsep=100, hazard_func= function(x, lambda){const_hazard(x, lambda=200)})
opts5<- list(truncRlim =10^(-3), minRlength= 2, maxRlength= 10^4, minsep=3, missPts = 10,
             maxsep=100, hazard_func= function(x, lambda){const_hazard(x, lambda=200)})


option_params<- list(opts1, opts2, opts3, opts4, opts5)

# function to allow running in online mode with same style of call
run_online_ocpd<-function(datapts, missPts, hazard_func=function(x, lambda){const_hazard(x, lambda=100)},
                          probModel, init_params,multivariate,truncRlim, minRlength, maxRlength, minsep, maxsep, fuzzwindow=0,
                          timing = FALSE, getR, optionalOutputs, printupdates=FALSE){
  if(multivariate) numpts<- dim(datapts)[1]
  if(!multivariate) numpts<- length(datapts)
  curr_ocpd_onres<-NULL
  for(k in 1:numpts){
    if(multivariate) datapt<- datapts[k,]
    if(!multivariate) datapt<- datapts[k]
    curr_ocpd_onres <- onlineCPD(datapt, oCPD= curr_ocpd_onres, missPts=missPts, hazard_func=hazard_func,
                                 probModel= probModel, init_params=init_params,
                                 multivariate=multivariate, truncRlim = truncRlim, minRlength= minRlength,
                                 maxRlength= maxRlength, minsep=minsep, maxsep=maxsep, getR = getR,
                                 optionalOutputs = optionalOutputs)

  }
  return(curr_ocpd_onres)
}

# function to call online cpd from lists of params in offline mode and online mode
run_ocpds<- function(data_param, option_param){
  # offline mode
  offres<- onlineCPD(datapts = data_param$datapts, probModel = data_param$probModel,hazard_func = option_param$hazard_func,
                     init_params = data_param$init_params, multivariate = data_param$multivariate, missPts = option_param$missPts,
                     truncRlim = option_param$truncRlim, minRlength= option_param$minRlength,
                     maxRlength= option_param$maxRlength,
                     minsep=option_param$minsep, maxsep=option_param$maxsep,
                     #fuzzwindow= option_param$fuzzwindow,
                     getR=TRUE, optionalOutputs = TRUE)

  # online mode
  onres<-NULL
  onres<- run_online_ocpd(datapts = data_param$datapts, missPts = option_param$missPts, probModel = data_param$probModel,
                          hazard_func = option_param$hazard_func,
                          init_params = data_param$init_params, multivariate = data_param$multivariate,
                          truncRlim = option_param$truncRlim, minRlength= option_param$minRlength,
                          maxRlength= option_param$maxRlength,
                          minsep=option_param$minsep, maxsep=option_param$maxsep,
                          #fuzzwindow= option_param$fuzzwindow,
                          getR=TRUE, optionalOutputs = TRUE)
  return(list(onres=onres, offres=offres))
}

# custom expect function:
expect_subset<- function(objList, trueResult, tol=3){
  for(obj in objList){
    expect(any(abs(trueResult-obj) < tol),
           sprintf(paste("Object: ", obj, "not found in true list: ", list(trueResult))))
  }
}

# set up loop to run "testthat" with all possible params
for(dataid in 1:length(data_params)){
  for(optid in 1:length(option_params)){
    testcase<- paste0("Data params: ", dataid, "  ", list(data_params[[dataid]]$probModel),
                      list(data_params[[dataid]]$init_params), list(data_params[[dataid]]$multivariate),
                      "  Option params:  ", optid, "  ", list(option_params[[optid]]))
    test_that(testcase,{
      ocpd_res<- run_ocpds(data_param = data_params[[dataid]], option_param = option_params[[optid]])
      for(cplistid in 1:length(ocpd_res$onres$changepoint_lists)){
        oncps<- ocpd_res$onres$changepoint_lists[[cplistid]][[1]]
        offcps<- ocpd_res$offres$changepoint_lists[[cplistid]][[1]]

        expect_subset(oncps, trueCPs, tol=30)
        expect_subset(offcps, trueCPs, tol=30)
      }

      # test outputting functions do not produce errors
      invisible(capture_output({
        expect_error(plot(ocpd_res$onres), NA)
        expect_error(plot(ocpd_res$offres), NA)
        expect_error(str(ocpd_res$onres), NA)
        expect_error(str(ocpd_res$offres), NA)
        expect_error(summary(ocpd_res$onres), NA)
        expect_error(summary(ocpd_res$offres), NA)
        expect_error(print(ocpd_res$onres), NA)
        expect_error(print(ocpd_res$offres), NA)
      }))
    })
  }
}
