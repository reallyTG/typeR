## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "672px",
  out.height = "480px",
  fig.width = 7,
  fig.height = 5,
  fig.align = "center",
  fig.retina = 1,
  dpi = 72
)


library(muHVT)
library(dplyr)
library(kableExtra)
library(geozoo)
library(plotly)

options(expressions = 10000)



global_var <- nzchar(Sys.getenv("RUN_VIGNETTE"))
#global_var <- TRUE

scrolLimit <- function(noOfRows){
  if(noOfRows<10){
    
    swe = paste(as.character(noOfRows*50),"px")
  }
  else{
    swe = "400px"
  }
  return(swe)
}

Table <- function(data,scroll = F,limit=NULL){
  
  if(!is.null(limit)){
    data <- head(data,limit)
  }
  
  kable_table <- data %>% kable(escape = F,align = "c") %>% kable_styling(bootstrap_options = c("striped", "hover", "responsive"))
  
  scroll <- scroll
  
  if(scroll == T){
  kable_table <- kable_table %>% scroll_box(width = "100%", height = scrolLimit(nrow(data)))
  }
  

  
  return(kable_table)
  
}

summaryTable <- function(data,scroll = T,columnName='Quant.Error',value=0.2,limit=NULL){
  
  scroll <- scroll
  summaryTable <- data %>%  dplyr::mutate_if(is.numeric, funs(round(.,2))) %>% dplyr::mutate(!!columnName:=  cell_spec(eval(parse(text = columnName)),color = ifelse(is.na(eval(parse(text = columnName))),"#333",ifelse(eval(parse(text = columnName)) < value,"red","#333"))))  
  
  return(Table(summaryTable,scroll = scroll,limit = limit))
  
}

compressionSummaryTable <- function(data,scroll = T,columnName='percentOfCellsBelowQuantizationErrorThreshold',value=0.8){
  
  
  summaryTable <- data %>%  dplyr::mutate_if(is.numeric, funs(round(.,2))) %>% dplyr::mutate(!!columnName:=  cell_spec(eval(parse(text = columnName)),color = ifelse(is.na(eval(parse(text = columnName))),"#00bb27",ifelse(eval(parse(text = columnName)) > value,"#00bb27","#333")))) 
  
  return(Table(summaryTable,scroll = scroll))
  
}


set.seed(240)

## ----Quantization Error,echo=FALSE,warning=FALSE,fig.show='hold',message=FALSE,out.width='90%',fig.height=8,fig.cap='Figure 1: The Voronoi tessellation for level 1 shown for the 5 cells with the points overlayed'----
knitr::include_graphics('quant_explainer.png')

## ----load data computer,warning=FALSE,message=FALSE,eval = T-------------
set.seed(240)
# Load data from csv files
computers <- read.csv("https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/Computers.csv")

## ----sample data computer,warning=FALSE,message=FALSE,eval = T-----------
# Quick peek
Table(head(computers))

## ----data structure computer,warning=FALSE,message=FALSE,eval = global_var----
str(computers)

## ----data summary computer,warning=FALSE,message=FALSE,eval = global_var----
summary(computers)

## ----train-test computer,warning=FALSE,message=FALSE,eval = global_var----
noOfPoints <- dim(computers)[1]
trainLength <- as.integer(noOfPoints * 0.8)

trainComputers <- computers[1:trainLength,]
testComputers <- computers[(trainLength+1):noOfPoints,]

## ----pre-processing data computer,warning=FALSE,message=FALSE,eval = global_var----
trainComputers <- trainComputers %>% dplyr::select(-c(X,cd,multi,premium,trend))
testComputers <- testComputers %>% dplyr::select(-c(X,cd,multi,premium,trend))

## ----HVT function,echo = TRUE, eval= FALSE-------------------------------
#  HVT(dataset, nclust, depth, quant.err, projection.scale, normalize = T, distance_metric = c("L1_Norm","L2_Norm"), error_metric = c("mean","max"))

## ----level one computers,warning=FALSE,message=FALSE,results='asis',eval = global_var----
set.seed(240)
hvt.results <- list()
hvt.results <- muHVT::HVT(trainComputers,
                          nclust = 15,
                          depth = 1,
                          quant.err = 0.2,
                          projection.scale = 10,
                          normalize = T)

## ----plotHVT function,echo = TRUE, eval= FALSE---------------------------
#  plotHVT(hvt.results, line.width, color.vec, pch1 = 21, centroid.size = 3, title = NULL)

## ----plot level one computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 2: The Voronoi tessellation for level 1 shown for the 15 cells in the dataset ’computers’',eval = global_var----
# Voronoi tesselation plot for level one
plotHVT(hvt.results,
        line.width = c(1.2), 
        color.vec = c("#141B41"))

## ----summary level one computers,warning=FALSE,eval = global_var---------
summaryTable(hvt.results[[3]][['summary']])

## ----compression summary level one computers,warning=FALSE,eval = global_var----
compressionSummaryTable(hvt.results[[3]]$compression_summary)

## ----hvtHmap function,echo = TRUE, eval= FALSE---------------------------
#  hvtHmap(hvt.results, dataset, child.level, hmap.cols, color.vec ,line.width, palette.color = 6)

## ----hmp level one quantization computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 3: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’computers’ dataset',eval = global_var----
hvtHmap(hvt.results, 
        trainComputers, 
        child.level = 1,
        hmap.cols = "quant_error", 
        line.width = c(0.2),
        color.vec = c("#141B41"),
        palette.color = 6,
        centroid.size = 3,
        show.points = T)

## ----level two computers,warning=FALSE,message=FALSE,results="hide",eval = global_var----
set.seed(240)
hvt.results2 <- list()
# depth=2 is used for level2 in the hierarchy
hvt.results2 <- muHVT::HVT(trainComputers,
                           nclust = 15,
                           depth = 2,
                           quant.err = 0.2,
                           projection.scale = 10,
                           normalize = T)

## ----plot level two computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 4: The Voronoi tessellation for level 2 shown for the 225 cells in the dataset ’computers’',eval = global_var----
# Voronoi tesselation plot for level two
plotHVT(hvt.results2, 
        line.width = c(1.2, 0.8), 
        color.vec = c("#141B41","#0582CA"))

## ----summary level two computers,warning=FALSE,eval = global_var---------
summaryTable(hvt.results2[[3]][['summary']],limit = 50)

## ----compression summary level two computers,warning=FALSE,eval = global_var----
compressionSummaryTable(hvt.results2[[3]]$compression_summary)

## ----hmp level two quantization computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 5: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’computers’ dataset',eval = global_var----
hvtHmap(hvt.results2, 
        trainComputers, 
        child.level = 2,
        hmap.cols = "quant_error", 
        line.width = c(0.8,0.2),
        color.vec = c("#141B41","#0582CA"),
        palette.color = 6,
        centroid.size = 2,
        show.points = T)

## ----level three computers,warning=FALSE,message=FALSE,results="hide",eval = global_var----
set.seed(240)
hvt.results3 <- list()
# depth=3 is used for level3 in the hierarchy
hvt.results3 <- muHVT::HVT(trainComputers,
                           nclust = 15,
                           depth = 3,
                           quant.err = 0.2,
                           projection.scale = 10,
                           normalize = T)

## ----plot level three computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 6: The Voronoi tessellation for level 3 shown for the 1905 cells in the dataset ’computers’',eval = global_var----
# Voronoi tesselation plot for level three
plotHVT(hvt.results3,
        line.width = c(1.2,0.8,0.4),
        color.vec = c("#141B41","#0582CA","#8BA0B4"),
        centroid.size = 3)

## ----summary level three computers,warning=FALSE,eval = global_var-------
summaryTable(hvt.results3[[3]][['summary']],scroll = T,limit = 500)

## ----compression summary level three computers,warning=FALSE,eval = global_var----
compressionSummaryTable(hvt.results3[[3]]$compression_summary)

## ----hmp level three quantization computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 7: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’computers’ dataset',eval = global_var----
hvtHmap(hvt.results3, 
        trainComputers, 
        child.level = 3,
        hmap.cols = "quant_error", 
        line.width = c(1.2,0.8,0.4),
        color.vec = c("#141B41","#6369D1","#D8D2E1"),
        palette.color = 6,
        show.points = T,
        centroid.size = 1.1)

## ----hmp level one computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 8: The Voronoi tessellation with the heat map overlaid for variable ’price’ at level 1 from ’computers’ dataset',eval = global_var----
hvtHmap(hvt.results, 
        trainComputers, 
        child.level = 1,
        hmap.cols = "price", 
        line.width = c(0.2),
        color.vec = c("#141B41"),
        palette.color = 6,
        show.points = T,
        centroid.size = 3)

## ----hmp level two computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 9: The Voronoi tessellation with the heat map overlaid for the variable ’price’ at level 2 from the ’computer’ dataset',eval = global_var----
hvtHmap(hvt.results2, 
        trainComputers, 
        child.level = 2, 
        hmap.cols = "price",
        line.width = c(0.8,0.2),
        color.vec = c("#141B41","#0582CA"),
        palette.color = 6,
        show.points = T,
        centroid.size = 2)

## ----hmp level three computers,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 10: The Voronoi tessellation with the heat map overlaid for the variable ’price’ at level 3 from the ’computer’ dataset',eval = global_var----
hvtHmap(hvt.results3, 
        trainComputers, 
        child.level = 3, 
        hmap.cols = "price",
        line.width = c(1.2,0.8,0.4),
        color.vec = c("#141B41","#6369D1","#D8D2E1"),
        palette.color = 6,
        show.points = T,
        centroid.size = 1.1)

## ----hmp level one computers speed,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 11: The Voronoi tessellation with the heat map overlaid for variable ’speed’ at level 1 from ’computers’ dataset',eval = global_var----
hvtHmap(hvt.results, 
        trainComputers, 
        child.level = 1,
        hmap.cols = "speed", 
        line.width = c(0.2),
        color.vec = c("#141B41"),
        palette.color = 6,
        show.points = T,
        centroid.size = 3)

## ----hmp level two computers speed,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 12: The Voronoi tessellation with the heat map overlaid for the variable ’speed’ at level 2 from the ’computer’ dataset',eval = global_var----
hvtHmap(hvt.results2, 
        trainComputers, 
        child.level = 2, 
        hmap.cols = "speed",
        line.width = c(0.8,0.2),
        color.vec = c("#141B41","#0582CA"),
        palette.color = 6,
        show.points = T,
        centroid.size = 2)

## ----hmp level three computers speed,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 13: The Voronoi tessellation with the heat map overlaid for the variable ’speed’ at level 3 from the ’computer’ dataset',eval = global_var----
hvtHmap(hvt.results3, 
        trainComputers, 
        child.level = 3, 
        hmap.cols = "speed",
        line.width = c(1.2,0.8,0.4),
        color.vec = c("#141B41","#6369D1","#D8D2E1"),
        palette.color = 6,
        show.points = T,
        centroid.size = 1.1)

## ----predictHVT function,echo = TRUE, eval= FALSE------------------------
#  predictHVT(data,hvt.results,hmap.cols = NULL,child.level = 1,...)

## ----predictHVT hmap computers,warning=FALSE,message=FALSE,eval = global_var----
set.seed(240)
predictions <- muHVT::predictHVT(testComputers,
                                 hvt.results3,
                                 hmap.cols = NULL,
                                 child.level = 3)

## ----predictHVT pred computers,warning=FALSE,eval = global_var-----------
Table(predictions$predictions,scroll = T,limit = 10)

## ----predictHVT2 computers,warning=FALSE,message=FALSE,eval=global_var----
set.seed(240)
testComputers <- testComputers %>% dplyr::select(-c(screen,ads))
predictions <- muHVT::predictHVT(testComputers,
                                 hvt.results3,
                                 hmap.cols = NULL,
                                 child.level = 3)
Table(predictions$predictions,scroll = T,limit = 10)

## ----torus generate,warning=FALSE,message=FALSE,results="hide",eval = global_var----
library(geozoo)
library(plotly)

set.seed(240)
# Here p reprensents dimension of object
# n reperesents number of points
torus <- geozoo::torus(p = 3,n = 1000)
torus_df <- data.frame(torus$points)
colnames(torus_df) <- c("x","y","z")

## ----torus head, warning=FALSE, eval = global_var------------------------
Table(head(torus_df))

## ----torus structure, warning=FALSE, eval = global_var-------------------
str(torus_df)

## ----torus summary, warning=FALSE,eval = global_var----------------------
summary(torus_df)

## ----torus plot,warning=FALSE,message=FALSE,fig.show="hold",fig.cap='Figure 14: 3D Torus',eval = global_var----
#plot_torus <- plotly::plot_ly(torus_df, x= ~x, y= ~y, z = ~z, color = ~z) %>% add_markers()
#plot_torus
knitr::include_graphics('torus.png')

## ----torus hvt first,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 15: The Voronoi tessellation for level 1 shown for the 100 cells in the dataset ’torus’',eval = global_var----
set.seed(240)
hvt.torus <- muHVT::HVT(torus_df,
                        nclust = 100,
                        depth = 1,
                        quant.err = 0.1,
                        projection.scale = 10,
                        normalize = T)

plotHVT(hvt.torus,line.width = c(0.8),color.vec = c("#141B41"),centroid.size = 1)

## ----compression summary torus first,warning=FALSE,eval = global_var-----
compressionSummaryTable(hvt.torus[[3]]$compression_summary)

## ----hmp level one quantization torus,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 16: The Voronoi tessellation for level 1 with the heat map overlaid for variable ’quant_error’ in the ’torus’ dataset',eval = global_var----
hvtHmap(hvt.torus, 
        torus_df, 
        child.level = 1,
        hmap.cols = "quant_error", 
        line.width = c(0.8),
        color.vec = c("#141B41"),
        palette.color = 6,
        show.points = T,
        centroid.size = 3)

## ----torus hvt second,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 17: The Voronoi tessellation for level 1 shown for the 200 cells in the dataset ’torus’',eval = global_var----
set.seed(240)
hvt.torus2 <- muHVT::HVT(torus_df,
                         nclust = 200,
                         depth = 1,
                         quant.err = 0.1,
                         projection.scale = 10,
                         normalize = T)
plotHVT(hvt.torus2,line.width = c(0.8),color.vec=c("#141B41"),centroid.size = 1)

## ----compression summary torus second,warning=FALSE,eval = global_var----
compressionSummaryTable(hvt.torus2[[3]]$compression_summary)

## ----hmp level two quantization torus,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 18: The Voronoi tessellation for level 2 with the heat map overlaid for variable ’quant_error’ in the ’torus’ dataset',eval = global_var----
hvtHmap(hvt.torus2, 
        torus_df, 
        child.level = 1,
        hmap.cols = "quant_error", 
        line.width = c(0.8),
        color.vec = c("#141B41"),
        palette.color = 6,
        centroid.size = 3,
        show.points = T)

## ----torus hvt third,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 19: The Voronoi tessellation for level 1 shown for the 500 cells in the dataset ’torus’',eval = global_var----
set.seed(240)
hvt.torus3 <- muHVT::HVT(torus_df,
                         nclust = 500,
                         depth = 1,
                         quant.err = 0.1,
                         projection.scale = 10,
                         normalize = T)

plotHVT(hvt.torus3,line.width = c(0.8),color.vec = c("#141B41"),centroid.size = 1)

## ----compression summary torus third,warning=FALSE,eval = global_var-----
compressionSummaryTable(hvt.torus3[[3]]$compression_summary)

## ----hmp level three quantization torus,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 20: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’torus’ dataset',eval = global_var----
hvtHmap(hvt.torus3, 
        torus_df, 
        child.level = 1,
        hmap.cols = "quant_error", 
        line.width = c(0.8),
        color.vec = c("#141B41"),
        palette.color = 6,
        show.points = T,
        centroid.size = 3)

## ----torus hvt forth,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 21: The Voronoi tessellation for level 2 shown for the 400 cells in the dataset ’torus’',eval = global_var----
set.seed(240)
hvt.torus4 <- muHVT::HVT(torus_df,
                         nclust = 20,
                         depth = 2,
                         quant.err = 0.1,
                         projection.scale = 10,
                         normalize = T)

plotHVT(hvt.torus4,line.width = c(0.8,0.3),color.vec = c("#141B41","#0582CA"),centroid.size = 2)

## ----compression summary torus forth,warning=FALSE,eval = global_var-----
compressionSummaryTable(hvt.torus4[[3]]$compression_summary)

## ----hmp level forth quantization torus,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 22: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’torus’ dataset',eval = global_var----
hvtHmap(hvt.torus4, 
        torus_df, 
        child.level = 2,
        hmap.cols = "quant_error", 
        line.width = c(0.8,0.4),
        color.vec = c("#141B41","#6369D1"),
        palette.color = 6,
        show.points = T,
        centroid.size = 2)

## ----sphere generate,warning=FALSE,message=FALSE,results="hide",eval = F----
#  library(geozoo)
#  library(plotly)
#  
#  set.seed(240)
#  sphere <- geozoo::sphere.hollow(p = 3, n = 1000)
#  sphere_df <- data.frame(sphere$points)
#  colnames(sphere_df) <- c("x","y","z")

## ----sphere head, warning=FALSE, eval = F--------------------------------
#  Table(head(sphere_df))

## ----sphere structure, warning=FALSE, eval = F---------------------------
#  str(sphere_df)

## ----sphere summary, warning=FALSE,eval = F------------------------------
#  summary(sphere_df)

## ----sphere plot,warning=FALSE,message=FALSE,results="asis",fig.cap='Figure 26: 3D hollow sphere',eval = F----
#  plot_sphere <- plotly::plot_ly(sphere_df, x= ~x, y= ~y, z = ~z, color = ~z) %>% add_markers()
#  plot_sphere

## ----sphere hvt first,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 27: The Voronoi tessellation for level 1 shown for the 100 cells in the dataset ’sphere’',eval = F----
#  set.seed(240)
#  hvt.sphere <- muHVT::HVT(sphere_df,
#                           nclust = 100,
#                           depth = 1,
#                           quant.err = 0.1,
#                           projection.scale = 10,
#                           normalize = T)
#  
#  plotHVT(hvt.sphere,line.width = c(0.8),color.vec = c("#141B41"),centroid.size = 1)

## ----compression summary sphere first,warning=FALSE,eval = F-------------
#  compressionSummaryTable(hvt.sphere[[3]]$compression_summary)

## ----hmp level one quantization sphere,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 28: The Voronoi tessellation for level 1 with the heat map overlaid for variable ’quant_error’ in the ’sphere’ dataset',eval = F----
#  hvtHmap(hvt.sphere,
#          sphere_df,
#          child.level = 1,
#          hmap.cols = "quant_error",
#          line.width = c(0.8),
#          color.vec = c("#141B41"),
#          palette.color = 6,
#          show.points = T,
#          centroid.size = 3)

## ----sphere hvt second,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 29: The Voronoi tessellation for level 1 shown for the 200 cells in the dataset ’sphere’',eval = F----
#  set.seed(240)
#  hvt.sphere2 <- muHVT::HVT(sphere_df,
#                            nclust = 200,
#                            depth = 1,
#                            quant.err = 0.1,
#                            projection.scale = 10,
#                            normalize = T)
#  
#  plotHVT(hvt.sphere2,line.width = c(0.8),color.vec = c("#141B41"),centroid.size = 1)

## ----compression summary sphere two,warning=FALSE,eval = F---------------
#  compressionSummaryTable(hvt.sphere2[[3]]$compression_summary)

## ----hmp level two quantization sphere,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 30: The Voronoi tessellation for level 1 with the heat map overlaid for variable ’quant_error’ in the ’sphere’ dataset',eval = F----
#  hvtHmap(hvt.sphere2,
#          sphere_df,
#          child.level = 1,
#          hmap.cols = "quant_error",
#          line.width = c(0.8),
#          color.vec = c("#141B41"),
#          palette.color = 6,
#          centroid.size = 3,
#          show.points = T)

## ----sphere hvt third,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 31: The Voronoi tessellation for level 1 shown for the 500 cells in the dataset ’sphere’',eval = F----
#  set.seed(240)
#  hvt.sphere3 <- muHVT::HVT(sphere_df,
#                            nclust = 500,
#                            depth = 1,
#                            quant.err = 0.1,
#                            projection.scale = 10,
#                            normalize = T)
#  
#  plotHVT(hvt.sphere3,line.width = c(0.8),color.vec = c("#141B41"),centroid.size = 1)

## ----compression summary sphere three,warning=FALSE,eval = F-------------
#  compressionSummaryTable(hvt.sphere3[[3]]$compression_summary)

## ----hmp level three quantization sphere,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 32: The Voronoi tessellation with the heat map overlaid for variable ’quant_error’ in the ’sphere’ dataset',eval = F----
#  hvtHmap(hvt.sphere3,
#          sphere_df,
#          child.level = 1,
#          hmap.cols = "quant_error",
#          line.width = c(0.8),
#          color.vec = c("#141B41"),
#          palette.color = 6,
#          show.points = T,
#          centroid.size = 3)

## ----sphere hvt forth,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 33: The Voronoi tessellation for level 2 shown for the 576 cells in the dataset ’torus’',eval = F----
#  set.seed(240)
#  hvt.sphere4 <- muHVT::HVT(sphere_df,
#                            nclust = 24,
#                            depth = 2,
#                            quant.err = 0.1,
#                            projection.scale = 10,
#                            normalize = T)
#  
#  plotHVT(hvt.sphere4,line.width = c(0.8,0.3),color.vec = c("#141B41","#0582CA"),centroid.size = 2)

## ----compression summary sphere forth,warning=FALSE,eval = F-------------
#  compressionSummaryTable(hvt.sphere4[[3]]$compression_summary)

## ----hmp level forth quantization sphere,warning=FALSE,fig.show='hold',results='hide',message=FALSE,fig.cap='Figure 34: The Voronoi tessellation for level 2 with the heat map overlaid for variable ’quant_error’ in the ’sphere’ dataset',eval = F----
#  hvtHmap(hvt.sphere4,
#          sphere_df,
#          child.level = 2,
#          hmap.cols = "quant_error",
#          color.vec = c("#141B41","#6369D1"),
#          line.width = c(0.8,0.4),
#          palette.color = 6,
#          show.points = T,
#          centroid.size = 2)

