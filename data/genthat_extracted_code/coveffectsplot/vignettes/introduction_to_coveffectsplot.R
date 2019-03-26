## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=TRUE, results='asis',fig.align = "center",fig.width = 6-------
set.seed(657687)
df <- data.frame(
MASS::mvrnorm(n = 10000,
                mu = c(10,0.75,1.5),
                Sigma=matrix(c((10*0.05)^2,
                               0.001,0.001,0.001,(0.75*0.05)^2,
                               0.001,0.001,0.001,(1.5*0.05)^2),3,3,byrow = TRUE) 
))
names(df) <- c("POPCL","dWTdCL","dSEXdCL")
knitr::kable(head(df,5))

## ---- echo=FALSE, results='asis',fig.align = "center",fig.width = 6------
dflong <- tidyr::gather(df)

ggplot2::ggplot(dflong,ggplot2::aes(x=value,fill=key))+
  ggplot2::geom_density(alpha=0.2)+
    ggplot2::facet_wrap(~key,scales="free",ncol=1)+
    ggplot2::labs(fill="",x="Uncertainty Distribution of the parameters")+
  ggplot2::theme(legend.position = "right",legend.background = 
                   ggplot2::element_rect(fill="transparent"))+
  ggplot2::guides(fill=ggplot2::guide_legend(reverse = TRUE))

dfcov<- data.frame(
MASS::mvrnorm(n=10000 ,
                mu =c(65,75),
                Sigma=matrix(c(15^2,0.01,0.01,15^2),2,2,byrow = TRUE) 
))
names(dfcov)<- c("WTWOMAN","WTMAN")
dfcovlong <- tidyr::gather(dfcov)
ggplot2::ggplot(dfcovlong,ggplot2::aes(x=value,fill=key))+
  ggplot2::geom_density(alpha=0.2)+
  ggplot2::labs(fill="",x="Weight (kg)")+
  ggplot2::theme(legend.position = "right",legend.background = 
                   ggplot2::element_rect(fill="transparent"))+
  ggplot2::guides(fill=ggplot2::guide_legend(reverse = TRUE))


dfcovlongquantile<- as.data.frame(
  quantile(dfcovlong$value,probs=c(0,0.05,0.25,0.5,0.75,0.95,1))
)
names(dfcovlongquantile)<- "Weightquantilevalue"
dfcovlongquantile$quantile<- rownames(dfcovlongquantile)


dfcovlongquantiletable<- t(dfcovlongquantile)
knitr::kable(dfcovlongquantiletable[1,,drop=FALSE],row.names=FALSE)

## ---- echo=TRUE,fig.align = "center",fig.width = 6-----------------------
CLBSVdistribution <- data.frame(CL= 10*exp(rnorm(10000,0,sd=0.09^0.5)))
CLBSVdistribution$CLBSV<- CLBSVdistribution$CL/10

## ---- echo=FALSE,fig.align = "center",fig.width = 6----------------------
dfbsv<- as.data.frame(
  quantile(CLBSVdistribution$CLBSV,probs=c(0,0.05,0.25,0.5,0.75,0.95,1)))
names(dfbsv)<- "BSVquantilevalue"
dfbsv$quantile<- rownames(dfbsv)
BSVLINE1<- data.frame(
                       mid = 1,
                       lower=quantile(CLBSVdistribution$CLBSV,c(0.05)),
                       upper=quantile(CLBSVdistribution$CLBSV,c(0.95)),
                       extent="BSV90%")

BSVLINE2<- data.frame( 
                       mid = 1,
                       lower=quantile(CLBSVdistribution$CLBSV,c(0.25)),
                       upper=quantile(CLBSVdistribution$CLBSV,c(0.75)),
                       extent="BSV50%")

BSVLINE <- rbind(BSVLINE1,BSVLINE2)
ggplot2::ggplot(data= CLBSVdistribution)+
 ggplot2:: geom_density(ggplot2::aes(x=CLBSV,
                   col="simomega")) +
   ggplot2::geom_rect(data=BSVLINE,
            ggplot2::aes(xmin=lower,xmax=upper  ,
                fill=extent),ymin=-Inf,ymax=Inf ,
           alpha=0.1)+
  ggplot2::geom_vline(xintercept=c(0.8,1,1.25))+
  ggplot2::theme_bw(base_size = 16)+
  ggplot2::theme(axis.text.y = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(),
        axis.text.x=ggplot2::element_text(size=12))+
  ggplot2::scale_x_continuous(breaks=c(0.25,0.5,0.8,1,1.25,1.5,2,3))+
  ggplot2::coord_cartesian(xlim=c(0.4,2))+
  ggplot2::labs(colour="",fill="BSV Coverage",x="BSVCL/Reference CL",
                title="Illustrating 30% BSV")+
  ggplot2::guides(fill = ggplot2::guide_legend(override.aes =  list(alpha = 0.1)  ))



dfbsvtable<- t(dfbsv)
knitr::kable(dfbsvtable[1,,drop=FALSE],row.names=FALSE)

## ----fig.width= 7--------------------------------------------------------
dfeffects <- df
dfeffects$REF <- dfeffects$POPCL/ median(dfeffects$POPCL)
dfeffects$SEX_FEMALE_WT_50 <- dfeffects$REF*(50/70)^dfeffects$dWTdCL
dfeffects$SEX_FEMALE_WT_90 <-  dfeffects$REF*(90/70)^dfeffects$dWTdCL
dfeffects$SEX_Male_WT_70 <- dfeffects$dSEXdCL
dfeffects$SEX_Male_WT_90 <- dfeffects$dSEXdCL*dfeffects$REF*(90/70)^dfeffects$dWTdCL
dfeffects$BSV<-  CLBSVdistribution$CLBSV

dfeffects<- dfeffects[,c("SEX_FEMALE_WT_50",
                         "SEX_FEMALE_WT_90",
                         "SEX_Male_WT_70",
                         "SEX_Male_WT_90",
                         "REF",
                         "BSV")]


dflong <- tidyr::gather(dfeffects)
ggplot2::ggplot(dflong,ggplot2::aes(x=value,y=key,fill=factor(..quantile..)))+
ggridges::stat_density_ridges(
  geom = "density_ridges_gradient", calc_ecdf = TRUE,
  quantile_lines = TRUE, rel_min_height = 0.01,
  quantiles = c(0.05,0.5, 0.95)) +
  ggplot2::scale_fill_manual(
    name = "Probability", values = c("#FF0000A0", "white","white", "#0000FFA0"),
    labels = c("(0, 0.05]", "(0.05, 0.5]","(0.5, 0.95]", "(0.95, 1]")
  )+
      ggplot2::annotate(
        "rect",
        xmin = 0.8,
        xmax = 1.25,
        ymin = -Inf,
        ymax = Inf,
        fill = "gray",alpha=0.4
      )+
  ggplot2::geom_vline(
      ggplot2::aes(xintercept = 1),
      size = 1
    )+
  ggplot2::theme_bw()+
  ggplot2::labs(x="Effects Relative to parameter reference value",y="")

## ----fig.width= 7--------------------------------------------------------
ggplot2::ggplot(dfeffects)+
  ggplot2::geom_density(ggplot2::aes(x=REF,y=..scaled..,col="a.Uncertainty\nRSE=5%"))+
  ggplot2::geom_density(data=dfcovlong,
                        ggplot2::aes(x=(value/70)^0.75 ,
                                y=..scaled..,col="b.Weight\nMean=70 kg, sd=15 kg"))+
  ggplot2::geom_density(data=CLBSVdistribution ,ggplot2::aes(x=CLBSV,
                                     y=..scaled..,col="c.Between subject variability\nCV=30%"))+
  ggplot2::theme_bw(base_size = 16)+
  ggplot2::theme(axis.text.y = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank())+
  ggplot2::scale_x_continuous(breaks=c(0.25,0.5,0.8,1,1.25,1.5,2,3))+
  ggplot2::coord_cartesian(xlim=c(0.25,2))+
  ggplot2::labs(color="",x="Effects Relative to parameter reference value",y= "Scaled Density")


## ------------------------------------------------------------------------
dfeffects$SEX_Male_WT_90<- NULL
dfeffectslong<- tidyr::gather(dfeffects)
dfeffectslong<- dplyr::group_by(dfeffectslong,key)
dfeffectslongsummaries<- dplyr::summarise(dfeffectslong,mid=quantile(value,0.5),
                                   lower=quantile(value,0.05),
                                   upper=quantile(value,0.95))

dfeffectslongsummaries$paramname <- "CL"
dfeffectslongsummaries$covname <- c("BSV","REF","Weight","Weight","Sex")
dfeffectslongsummaries$label <- c("95% of patients","70 kg/Woman",
                                  "50 kg/Woman", "90 kg/Woman","70 kg/Man")
dfeffectslongsummaries<- rbind(dfeffectslongsummaries,
data.frame(key=c("BSV","BSV"),
           mid=c(quantile(dfeffects$BSV,0.5), quantile(dfeffects$BSV,0.5)),
           lower = c(quantile(dfeffects$BSV,0.25), quantile(dfeffects$BSV,0.05)),
            upper = c(quantile(dfeffects$BSV,0.75), quantile(dfeffects$BSV,0.95)),
           paramname= "CL",
           covname=c("BSV","BSV"),
           label = c("50% of patients","90% of patients")
)
)
dfeffectslongsummaries<- dfeffectslongsummaries[c(2,6,7,3,4,5),]

plotdata <- dplyr::mutate(dfeffectslongsummaries,
          LABEL = paste0(format(round(mid,2), nsmall = 2),
                         " [", format(round(lower,2), nsmall = 2), "-",
                         format(round(upper,2), nsmall = 2), "]"))
plotdata<- as.data.frame(plotdata)
plotdata<- plotdata[,c("paramname","covname","label","mid","lower","upper","LABEL")]
knitr::kable(plotdata)


## ----fig.width=7---------------------------------------------------------
plotdata$covname <- as.factor(plotdata$covname)
plotdata$covname <- reorder(plotdata$covname , c(3,4,4,2,1,1))

plotdata$label <- reorder(as.factor(plotdata$label) , c(1,3,2,4,5,6))
  ggplot2::ggplot(data = plotdata, ggplot2::aes_string(
      y = "label",
      x = "mid",
      xmin = "lower",
      xmax = "upper"
    )) +
    ggstance::geom_pointrangeh(
      position = ggstance::position_dodgev(height = 0.75),
      ggplot2::aes(color = "90 %CI\nCovariate Effects"),
      size = 1,
      alpha = 1
    )+
  ggplot2::annotate("rect", xmin = min(0.8), 
      xmax = max(1.25), ymin = -Inf, ymax = Inf, fill = "gray",alpha=0.1)+
  ggplot2::geom_vline(ggplot2::aes(xintercept = 1,linetype="Reference"))+ 
  ggplot2::facet_grid(covname~.,scales="free_y",switch="y")+
  ggplot2::labs(y="",x="Effects Relative to Reference Value",
                colour="",linetype="")+
  ggplot2::theme_bw()

  
  
  suppressPackageStartupMessages( require(dplyr) )
  plotdata<- plotdata[ c(3,2,1,4,5,6),]

  plotly::plot_ly(plotdata) %>%
  plotly::add_segments(
  x = ~ round(lower, 2),
  xend = ~ round(upper, 2),
  y = ~ label,
  yend = ~ label,
  name = '90%CI',
  line = list(color = plotly::toRGB("blue", alpha = 0.5), width = 5),
  hoverinfo = "text",
  text = ~ paste("</br> 90%CI: ",
  paste(round(lower, 2), round(upper, 2)))
  ) %>%
  
  plotly::add_markers(
  x = ~ round(mid, 2),
  y = ~ label,
  name = "Median",
  marker  = list(
  color = plotly::toRGB("black", alpha = 0.3),
  size = 20,
  symbol = "diamond"
  ),
  hoverinfo = "text",
  text = ~ paste("</br> Mean: ",
  paste(round(mid, 2)))
  ) %>%
  plotly::layout(
  xaxis = list(
  title = 'Effects Relative to Reference',
  ticks = "outside",
  autotick = TRUE,
  ticklen = 5,
  gridcolor = plotly::toRGB("gray50"),
  showline = TRUE
  ) ,
  yaxis = list (
  title = '' ,
  autorange = TRUE, 
  type = "category",
  categoryorder = "trace", 
  ticks = "outside",
  autotick = TRUE,
  ticklen = 5,
  gridcolor = plotly::toRGB("gray50"),
  showline = TRUE
  ),
     shapes =list(
      type = "rect", 
      x0 = 0.8, 
      x1 = 1.25, 
      xref = "x",
      yref = "paper",
      y0 = 0, 
      y1 = 1, 
      line = list(width = 0),
      fillcolor =  plotly::toRGB("black", alpha = 0.3)
  
  )
  )

png("coveffectsplot.png",width =9 ,height = 6,units = "in",res=72)
coveffectsplot::forest_plot(plotdata,
            ref_area = c(0.8, 1/0.8),
            x_facet_text_size = 13,
            y_facet_text_size = 13,
            interval_legend_text = "Median (points)\n90% CI (horizontal lines)",
            ref_legend_text = "Reference (vertical line)\n+/- 20% ratios (gray area)",
            area_legend_text = "Reference (vertical line)\n+/- 20% ratios (gray area)",
            xlabel = "Fold Change Relative to Parameter",
            facet_formula = "covname~.",
            facet_switch = "both",
            facet_scales = "free",
            facet_space = "fixed",
            paramname_shape = TRUE,
            table_position = "right",
            table_text_size=4,
            plot_table_ratio = 4)
  dev.off()
  

