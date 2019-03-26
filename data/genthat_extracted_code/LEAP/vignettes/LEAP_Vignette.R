### R code from vignette source 'LEAP_Vignette.Rnw'

###################################################
### code chunk number 1: LEAP_Vignette.Rnw:65-67
###################################################
library("LEAP")
example_data[,1:5]


###################################################
### code chunk number 2: LEAP_Vignette.Rnw:82-85
###################################################
MAC_results = MAC_counter(data=example_data, max_lag_prop=1/3, MAC_cutoff=0.2, file_name="example", lag_matrix=T)

MAC_results[41:71,]


###################################################
### code chunk number 3: LEAP_Vignette.Rnw:92-93
###################################################
MAC_example[1:5,1:5]


###################################################
### code chunk number 4: LEAP_Vignette.Rnw:99-100
###################################################
lag_example[1:5,1:5]


###################################################
### code chunk number 5: LEAP_Vignette.Rnw:114-116
###################################################
MAC_perm(data=example_data, MACs_observ=MAC_example, num_perms=10, max_lag_prop=1/3,
         FDR_cutoffs=101, perm_file_name="example")


###################################################
### code chunk number 6: LEAP_Vignette.Rnw:125-126
###################################################
perm_example[74:101,]


###################################################
### code chunk number 7: LEAP_Vignette.Rnw:138-145
###################################################
cors=c()
lag = c()
for (i in(1:20)){

  cors = c(cors, na.omit(MAC_example[,i]))
  lag = c(lag, na.omit(lag_example[,i]))
}


###################################################
### code chunk number 8: LEAP_Vignette.Rnw:151-166
###################################################
lag_bin=c()
for(i in (1:380)){
  if(lag[i]==0){lag_bin[i]="0"
  }else if(lag[i]>0 & lag[i]<=10){lag_bin[i]="1-10"
  }else if(lag[i]>10 & lag[i]<=20){lag_bin[i]="11-20"
  }else if(lag[i]>20 & lag[i]<=30){lag_bin[i]="21-30"
  }else if(lag[i]>30 & lag[i]<=40){lag_bin[i]="31-40"
  }else if(lag[i]>40 & lag[i]<=50){lag_bin[i]="41-50"
  }else if(lag[i]>50 & lag[i]<=75){lag_bin[i]="51-75"
  }else if(lag[i]>75 & lag[i]<=100){lag_bin[i]="76-100"
  }else if(lag[i]>100 & lag[i]<=125){lag_bin[i]="101-125"
  }else if(lag[i]>125 & lag[i]<=150){lag_bin[i]="126-150"
  }else if(lag[i]>151 & lag[i]<=175){lag_bin[i]="151-175"
  }else{lag_bin[i]=">175"}
}


###################################################
### code chunk number 9: LEAP_Vignette.Rnw:172-176
###################################################
data = as.data.frame(cbind(cors,lag,lag_bin))
data$cors = as.numeric(as.character(data$cors))
data$lag_bin = factor(lag_bin, levels =c(">175", "151-175", "126-150", "101-125", "76-100", "51-75", "41-50", "31-40",
                                         "21-30", "11-20", "1-10", "0"))


###################################################
### code chunk number 10: LEAP_Vignette.Rnw:182-184
###################################################
library(ggplot2)
ggplot(data = data, aes(data$cors)) + geom_histogram(binwidth = 0.05, aes(fill = lag_bin)) + scale_y_sqrt() +xlab("Correlation") +ylab("Square Root Counts")+guides(fill=guide_legend(title="Lag")) + ggtitle("Histogram of Correlations")


###################################################
### code chunk number 11: LEAP_Vignette.Rnw:196-197
###################################################
output=MAC_counter(data=example_data, max_lag_prop=1/3, file_name="example", lag_matrix=T, symmetric=T)


###################################################
### code chunk number 12: LEAP_Vignette.Rnw:201-202
###################################################
MAC_symmetric[1:5,1:5]


###################################################
### code chunk number 13: LEAP_Vignette.Rnw:210-211
###################################################
sessionInfo()


