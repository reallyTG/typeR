## ----echo = FALSE, message = FALSE, results = 'hide', warning = FALSE, error=FALSE, screenshot.force=FALSE----
#Package installation if required for handbook

if (!requireNamespace("DT", quietly = TRUE)) {
     install.packages("DT", repos = "http://cloud.r-project.org/")
}

if (!requireNamespace("lubridate", quietly = TRUE)) {
     install.packages("lubridate", repos = "http://cloud.r-project.org/")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
     install.packages("ggplot2", repos = "http://cloud.r-project.org/")
}
library("magrittr")
library("Rdrools")
library("dplyr")
library("purrr")
library("tibble")

## ----setup, include=FALSE------------------------------------------------
options(stringsAsFactors = F)

## ------------------------------------------------------------------------
data("iris")
data("irisRules")
sampleRules <- irisRules
rownames(sampleRules) <- seq(1:nrow(sampleRules))
sampleRules[is.na(sampleRules)]    <-""
sampleRules

## ---- warning=FALSE,message=FALSE, echo=FALSE----------------------------
#' Vignette helper functions
#' @description: Function plot graphs in the vignette
#' -----------------------------------------------------------------------------
#' @param result result of rule check
#' @param plotName Plot to be generated
#' @param rules the rules defined in csv format
#' -----------------------------------------------------------------------------
#' @return a plotly plot
#' @keywords internal

plotgraphs <- function(result,plotName){
  
  if(plotName == "Plot of points distribution"){
    anomaliesCountPlot <-list()
    purrr::map (1:length(result),function(i){
      outputDataframe <- result[[i]][["output"]]
      noOfTrueFalse <-  outputDataframe %>% dplyr::group_by(IsTrue) %>%
        dplyr::summarise(Frequency = n())
      if(nrow(noOfTrueFalse)==2){
        
        noOfTrueFalse <- noOfTrueFalse %>% as.data.frame %>% `rownames<-`(c("Anomalies","Non-Anomalies"))  
        anomaliesCountPlot[[i]] <- ggplot2::ggplot(noOfTrueFalse, ggplot2::aes(x=IsTrue, y=Frequency)) +
          ggplot2::geom_bar(stat = "identity", fill="steelblue")+
          ggplot2::labs(title="Distribution of points \n for the rule", 
              y = "Count") +
          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
        
      }else{
        anomaliesCountPlot[[i]] <- NULL
      }
      
      return(anomaliesCountPlot)     
    })
  }else if(plotName == "Plot of groups"){
    plotAnomalies <-list()
    purrr::map (1:length(result),function(ruleNum){
      ruleName <- paste0("Rule",ruleNum)
      ruleValue <- paste0("Rule",ruleNum,"Value")
      intermediateOutput<- result[[ruleNum]][["intermediateOutput"]]
      
      if(class(intermediateOutput)=="list"){
        plotAnomalies[[ruleNum]] <- NULL
        
      }else {
        intermediateOutput<- dplyr::filter_(intermediateOutput,paste(ruleName,"==","'true'"))
        
        GroupedCols <- paste(colnames(intermediateOutput[,
                                                         !names(intermediateOutput) %in% c(ruleName,ruleValue)]),collapse = ":")
        intermediateOutput$Group <-  apply( intermediateOutput[ , !names(intermediateOutput) %in% c(ruleName,ruleValue) ] , 1 , paste , collapse = ":" )
        colnames(intermediateOutput)[ncol(intermediateOutput)-1] <- "values"
        
        plotAnomalies[[ruleNum]] <- ggplot2::ggplot(intermediateOutput, ggplot2::aes(x=Group, y=values))+
          ggplot2::geom_bar(stat = "identity",fill="steelblue")+
          ggplot2::labs(title="Groups satisfying the rule", 
               x=list(title = paste0("Grouped By - ",GroupedCols), tickangle = -45), y = "Aggregated Value") +
          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
        
        return(plotAnomalies)
        
      }
    })
  }
}

## ----comment=NA----------------------------------------------------------
filterRule <- sampleRules[1,]
filterRule
filterRuleOutput <- executeRulesOnDataset(iris, filterRule)
str(filterRuleOutput)

## ------------------------------------------------------------------------
anomaliesCountGraph <- plotgraphs(result=filterRuleOutput, plotName="Plot of points distribution")
anomaliesCountGraph[[1]][[1]]

## ----comment=NA----------------------------------------------------------
groupedAggregationRule <- sampleRules[2,]
groupedAggregationRule
groupedAggregationRuleOutput <- executeRulesOnDataset(iris, groupedAggregationRule)
str(groupedAggregationRuleOutput)

## ---- warning=FALSE,message=FALSE----------------------------------------
anomalousSetGraph<-plotgraphs(result=groupedAggregationRuleOutput, plotName="Plot of groups")
anomalousSetGraph[[1]][[1]]

## ---- warning=FALSE,message=FALSE----------------------------------------
anomaliesCountGraph<-plotgraphs(result=groupedAggregationRuleOutput, plotName="Plot of points distribution")
anomaliesCountGraph[[1]][[1]]

## ----comment=NA----------------------------------------------------------
columnAggregationRule <- sampleRules[3,]
columnAggregationRule
columnAggregationRuleOutput <- executeRulesOnDataset(iris, columnAggregationRule)
str(columnAggregationRuleOutput)

## ----comment=NA----------------------------------------------------------
filterColAggregationRule <- sampleRules[4,]
filterColAggregationRule
filterColAggregationRuleOutput <- executeRulesOnDataset(iris, filterColAggregationRule)
str(filterColAggregationRuleOutput)

## ----comment=NA----------------------------------------------------------
filterGroupByAggrRule <- sampleRules[5,]
filterGroupByAggrRule
filterGroupByAggrRuleOutput <- executeRulesOnDataset(iris, filterGroupByAggrRule)
str(filterGroupByAggrRuleOutput)

## ---- warning=FALSE,message=FALSE----------------------------------------
anomalousSetGraph<-plotgraphs(result=filterGroupByAggrRuleOutput, plotName="Plot of groups")
anomalousSetGraph[[1]][[1]]

## ----comment=NA----------------------------------------------------------
compareColumnsRule <- sampleRules[6,]
compareColumnsRule
compareColumnsRuleOutput <- executeRulesOnDataset(iris, compareColumnsRule)
str(compareColumnsRuleOutput)

## ---- warning=FALSE,message=FALSE----------------------------------------
anomaliesCountGraph<-plotgraphs(result=compareColumnsRuleOutput, plotName="Plot of points distribution")
anomaliesCountGraph[[1]][[1]]

## ----comment=NA----------------------------------------------------------
compareFilterRule <- sampleRules[7,]
compareFilterRule
compareFilterRuleOutput <- executeRulesOnDataset(iris, compareFilterRule)
str(compareFilterRuleOutput)

## ---- warning=FALSE,message=FALSE----------------------------------------
anomaliesCountGraph<-plotgraphs(result=compareColumnsRuleOutput, plotName="Plot of points distribution")
anomaliesCountGraph[[1]][[1]]

## ----warning=FALSE-------------------------------------------------------
data("transactionData")
transactionData$Date <- lubridate::ymd(transactionData$Date)
transactionData <- transactionData[1:500,]

## ----echo=FALSE,warning=FALSE--------------------------------------------
DT::datatable(
  head(transactionData, 20), extensions = 'FixedColumns',
  options = list(
  dom = 't',
  scrollX = TRUE,
  scrollCollapse = TRUE
))

## ----comment=NA,echo=FALSE-----------------------------------------------
str(transactionData)

## ----comment=NA----------------------------------------------------------
data("transactionRules")
rownames(transactionRules) <- seq(1:nrow(transactionRules))
transactionRules[is.na(transactionRules)]    <-""
transactionRules


## ------------------------------------------------------------------------
transactionDataOutput  <- executeRulesOnDataset(transactionData, transactionRules)

## ----comment=NA----------------------------------------------------------
length(transactionDataOutput)
str(transactionDataOutput[[5]]) #Rule 5 output

## ---- warning=FALSE,message=FALSE, fig.width=12--------------------------
anomaliesCountGraph<-plotgraphs(result=transactionDataOutput, plotName="Plot of points distribution")


## ---- warning=FALSE,message=FALSE----------------------------------------
anomaliesCountGraph[[5]][[5]]

## ---- warning=FALSE,message=FALSE----------------------------------------
anomalousSetGraph<-plotgraphs(result=transactionDataOutput, plotName="Plot of groups")
anomalousSetGraph[[5]][[5]]

