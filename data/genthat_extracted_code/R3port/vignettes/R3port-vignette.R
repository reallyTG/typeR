## ------------------------------------------------------------------------
library(R3port)
library(reshape2)
data(tips)
tips$day <- factor(tips$day,levels=c("Thur","Fri","Sat","Sun" ),ordered = TRUE)
head(tips)

## ------------------------------------------------------------------------
tbl1 <- means(tips,variable="total_bill",by=c("sex","day","time"),total="sex")
head(tbl1,20)

## ------------------------------------------------------------------------
tbl2       <- freq(tips,vars=c("sex","day","time"),total=c("sex","day"),spacechar = "~")
head(tbl2)

## ------------------------------------------------------------------------
ltx_doc("This is just some \\emph{text}")
html_doc("This is just some <em>text</em>")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  library(xtable)
#  xtbl     <- means(tips,variable="total_bill",by=c("day"))
#  xtbl_ltx <- print(xtable(xtbl),print.results=FALSE)
#  ltx_doc(xtbl_ltx,out="out1.tex")
#  
#  xtbl_html <- print(xtable(xtbl),print.results=FALSE,type="html", html.table.attributes = "class=table")
#  html_doc(xtbl_html,out="out1.html",
#           css="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  lst1 <- means(tips,variable="tip",by=c("sex","day"),pack=2)
#  lst2 <- means(tips,variable="total_bill",by=c("sex","day"),pack=2)
#  lst  <- merge(lst1,lst2,by=c("sex","day","statistic"))
#  names(lst)[4:5] <- c("tip","Total Bill")
#  
#  ltx_list(lst,vargroup=c("","","","income","income"),group = 2, title="a listing",
#           fill="-",footnote="a footnote",mancol="p{3cm}llll",out="out2.tex")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  html_list(lst,vargroup=c("","","","income","income"),group = 2,title="a listing",
#            fill="-",footnote="a footnote",out="out2.html")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  ltx_table(tbl1,x=c("sex","statistic"),y=c("day","time"),var="value",
#            title="total bill statistics",xabove=TRUE,out="out3.tex")
#  html_table(tbl1,x=c("sex","statistic"),y=c("day","time"),var="value",
#            title="total bill statistics",xabove=TRUE,out="out3.html")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  attr(tbl2$sex,"label") <- "Gender"
#  attr(tbl2$day,"label") <- "Day of the week"
#  ltx_table(tbl2,x=c("sex","day"),y=c("time"),var="FreqPerc",yhead = TRUE,size="\\normalsize",
#            title="customer frequency",xabove=TRUE,out="out4.tex",group=1,mancol="lllll",
#            template=paste0(system.file(package =  "R3port"), "/listing.tex"))

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  library(plyr)
#  tbl3           <- freq(tips,c("sex","day","time"),total=c("day","time"),spacechar = "~")
#  tbl3$statistic <- factor("N (perc)")
#  tbl3$value     <- tbl3$FreqPerc
#  tbl3           <- rbind.fill(tbl1,tbl3)
#  ltx_table(tbl3,x=c("sex","day"),y=c("time","statistic"),var="value",convchar = TRUE,
#            title="total bill statistics",xabove=TRUE,out="out5.tex",
#            mancol=paste(rep("l",16),collapse=""),
#            template=paste0(system.file(package =  "R3port"), "/listing.tex"))

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  # Used lwidth to ensure correct width in beamer presentations
#  library(ggplot2)
#  pl <- ggplot(tips,aes(x=day,y=total_bill)) + geom_boxplot()
#  ltx_plot(pl,out="out6.tex",titlepr = "plot A",
#           title="example for basic plotting",lwidth="0.9\\linewidth")
#  html_plot(pl,out="out6.html",titlepr = "plot A",
#            title="example for basic plotting")
#  
#  # you can output a list of plots e.g:
#  pl <- lapply(unique(tips$sex),function(x){
#    ggplot(tips[tips$sex==x,],aes(time,total_bill)) + geom_boxplot() +
#      facet_wrap(~day) + ggtitle(x)
#  })
#  ltx_plot(pl,out="out7.tex",titlepr = "plot B",
#           title="example for plotting lists",lwidth="0.9\\linewidth")
#  html_plot(pl,out="out7.html",titlepr = "plot B",
#            title="example for plotting lists")
#  
#  # base plots can be used but placed in function:
#  bpl <- function() plot(tips$day,tips$total_bill)
#  ltx_plot(bpl(),out="out8.tex",titlepr = "plot C",
#           title="example for base plot",lwidth="0.9\\linewidth")
#  html_plot(bpl(),out="out8.html",titlepr = "plot C",
#            title="example for base plot")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  ltx_combine(out="comb1.tex",template=paste0(system.file(package="R3port"),"/default.tex"))
#  html_combine(out="comb1.html",toctheme=TRUE,
#               template=paste0(system.file(package="R3port"),"/bootstrap.html"))

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  tmpl  <- list.files(system.file(package="R3port"),pattern="\\.tex$",full.names=TRUE)
#  lapply(1:length(tmpl),function(x){
#    ppt <- ifelse(grepl("beamer.tex",tmpl[x]),TRUE,FALSE)
#    ltx_combine(out=paste0("combt",x,".tex"),template=tmpl[x],presentation=ppt)
#  })

