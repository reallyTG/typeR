library(chillR)


### Name: make_multi_pheno_trend_plot
### Title: Combine multiple phenology contour plots in one figure
### Aliases: make_multi_pheno_trend_plot
### Keywords: utility

### ** Examples


#this example uses arbitrarily modified versions of the KA_bloom dataset, and the starts
#end ends of the periods are also arbitraty. So the outputs may not make a lot of sense...

weather<-fix_weather(KA_weather[which(KA_weather$Year>2000),])
pheno_list<-data.frame(varieties=c("KA1","KA2","KA3","KA4"), Start_chill=c(270,305,315,320),
  End_chill=c(15,20,35,40), Start_heat=c(17,25,40,45),End_heat=c(90,100,110,115),
  Link=c("KA1.csv","KA2.csv","KA3.csv","KA4.csv"))
  
 write.csv(KA_bloom,"KA1.csv",row.names=FALSE)
 KA_bloom$pheno<-as.numeric(as.character(KA_bloom$pheno))+10
 write.csv(KA_bloom,"KA2.csv",row.names=FALSE)
 KA_bloom$pheno<-KA_bloom$pheno+10
 write.csv(KA_bloom,"KA3.csv",row.names=FALSE)
 KA_bloom$pheno<-KA_bloom$pheno+10
 write.csv(KA_bloom,"KA4.csv",row.names=FALSE)

make_multi_pheno_trend_plot(pheno_list,weather, split_month=6,
           outpath=NA,file_name=NA,image_type="",fonttype="serif",percol=2)

 



