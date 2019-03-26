## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  # collapse = FALSE,
  # comment = "#>"
  results = "hold"
)

## ------------------------------------------------------------------------
library(echo.find)
head(expressions[,1:5])

## ----fig.align="center",fig.height = 4, fig.width = 6--------------------

library(ggplot2)

tp <- seq(2,48,by=2) # our time points
num_reps <- 3 # number of replicates

samp <- 2 # sample we want to look at
ex.df <- expressions[samp,-1] # expression data for the first sample

# our visualization data frame       
ribbon.df <- data.frame(matrix(ncol = 3+num_reps, nrow = length(tp)))
# assigning column names
colnames(ribbon.df) <- c("Times","Min","Max", 
                         paste(rep("Rep",num_reps),c(1:num_reps), sep=".")) 
ribbon.df$Times <- tp
# getting min values of replicates
ribbon.df$Min <- sapply(seq(1,ncol(ex.df), by = num_reps),
                        function(x) min(unlist(ex.df[,c(x:(num_reps-1+x))]), na.rm = TRUE))
# getting max values of replicates
ribbon.df$Max <- sapply(seq(1,ncol(ex.df), by = num_reps),
                        function(x) max(unlist(ex.df[,c(x:(num_reps-1+x))]), na.rm = TRUE))
# assign each of the replicates to the visualization data frame
for (i in 1:num_reps){ 
  ribbon.df[,3+i] <- t(ex.df[,seq(i,ncol(ex.df),by=num_reps)])
}

# color names
color_bar <- c("Rep.1"="red","Rep.2"="blue","Rep.3"="green")

# visualize, with shading for each row
p <- ggplot(data = ribbon.df,aes(x=Times))+ # declare the dataframe and main variables
  geom_ribbon(aes(x=Times, ymax=Max, ymin=Min, colour="Original"),
              fill = "gray", alpha = 0.5)+ # create shading
  ggtitle(expressions[samp,1])+ # gene name is title
  scale_color_manual("",values=color_bar)+
  scale_fill_manual("",values=color_bar)+
  theme(plot.title = element_text(hjust = .5),
        legend.position = "bottom",legend.direction = "horizontal")+
  labs(x="Hours", y="Expression") #Label for axes
# add specific replicate lines 
for (i in 1:num_reps){
  p <- p +
    geom_line(data = ribbon.df,
              aes_string(x="Times",y=paste("Rep",i,sep = ".")),
              colour=color_bar[i])
}

suppressWarnings(p) # to ignore warnings for missing values


## ------------------------------------------------------------------------
# echo_find() parameters

genes <- expressions
begin <- 2 # first time point
end <- 48 # last time point
resol <- 2 # time point resolution
num_reps <- 3 # number of replicates
low <- 20 # low period seeking
high <- 26 # high period seeking
run_all_per <- FALSE # we are not looking for all periods
paired <- FALSE # these replicates are unrelated, that is, a replicate being 
  # called "replicate 1" at time point 2 means nothing
rem_unexpr <- FALSE # do not remove unexpressed genes
# we do not assign rem_unexpr_amt, since we're not removing unexpressed genes
is_normal <- FALSE # do not normalize
is_de_linear_trend <- FALSE # do not remove linear trends
is_smooth <- FALSE # do not smooth the data

results <- echo_find(genes = genes, begin = begin, end = end, resol = resol, 
  num_reps = num_reps, low = low, high = high, run_all_per = run_all_per,
  paired = paired, rem_unexpr = rem_unexpr, is_normal = is_normal,
  is_de_linear_trend = is_de_linear_trend, is_smooth = is_smooth)

head(results[,1:16])

## ----fig.align="center",fig.height = 4, fig.width = 6--------------------
# assign the fit to the visualization data frame
ribbon.df$Fit <- t(results[samp,(17+(length(tp)*num_reps)):ncol(results)])

# visualize, with shading for each row
# add Fit line
p <- p +
  geom_line(data = ribbon.df,
            aes_string(x="Times",y="Fit"),
            colour="black")

suppressWarnings(p) # to ignore warnings for missing values
# print sample's parameters
cat(paste0("Gene Name: ",results$`Gene Name`[samp],"\n",
           "Convergence:", results$Convergence[samp],"\n",
           "Iterations:",results$Iterations[samp],"\n",
           "Forcing Coefficient:", results$Forcing.Coefficient[samp],"\n",
           "Oscillation Type:",results$`Oscillation Type`[samp],"\n",
           "Amplitude", results$Amplitude[samp],"\n",
           "Radian.Frequency:",results$Radian.Frequency[samp],"\n",
           "Period:",results$Period[samp],"\n",
           "Phase Shift:",results$`Phase Shift`[samp],"\n",
           "Hours Shifted:",results$`Hours Shifted`[samp],"\n",
           "P-Value:",results$`P-Value`[samp],"\n",
           "BH Adj P-Value:",results$`BH Adj P-Value`[samp],"\n",
           "BY Adj P-Value:",results$`BY Adj P-Value`[samp],"\n"))


## ------------------------------------------------------------------------

run_all_per <- TRUE # looking for all possible periods
rem_unexpr <- TRUE # remove unexpressed genes
rem_unexpr_amt <- 70 # percentage of unexpressed genes
is_normal <- TRUE # normalize
is_de_linear_trend <- TRUE # remove linear trends
is_smooth <- TRUE # smooth the data

# we're using the default values of low and high, since we're looking for all periods
results <- echo_find(genes = genes, begin = begin, end = end, resol = resol, 
  num_reps = num_reps, run_all_per = run_all_per, paired = paired, 
  rem_unexpr = rem_unexpr, rem_unexpr_amt = rem_unexpr_amt, is_normal = is_normal,
  is_de_linear_trend = is_de_linear_trend, is_smooth = is_smooth)

head(results[,1:16])


## ----fig.align="center",fig.height = 4, fig.width = 6--------------------

rep_genes <- results[samp,17:(16+(length(tp)*num_reps))]

 # getting min values of replicates
ribbon.df$Min <- sapply(seq(1,ncol(rep_genes), by = num_reps), 
                        function(x) min(unlist(rep_genes[,c(x:(num_reps-1+x))]),
                                        na.rm = TRUE))
 # getting max values of replicates
ribbon.df$Max <- sapply(seq(1,ncol(rep_genes), by = num_reps),
                        function(x) max(unlist(rep_genes[,c(x:(num_reps-1+x))]),
                                        na.rm = TRUE))
for (i in 1:num_reps){ # assign each of the replicates
  ribbon.df[,3+i] <- t(rep_genes[,seq(i,ncol(rep_genes),by=num_reps)])
}
# assign the fit to the visualization data frame
ribbon.df$Fit <- t(results[samp,(17+(length(tp)*num_reps)):ncol(results)])

# visualize, with shading for each row
p <- ggplot(data = ribbon.df,aes(x=Times))+ # declare the dataframe and main variables
  geom_ribbon(aes(x=Times, ymax=Max, ymin=Min, colour="Original"),
              fill = "gray", alpha = 0.5)+ # create shading
  ggtitle(expressions[samp,1])+ # gene name is title
  scale_color_manual("",values=color_bar)+
  scale_fill_manual("",values=color_bar)+
  theme(plot.title = element_text(hjust = .5),
        legend.position = "bottom",legend.direction = "horizontal")+
  labs(x="Hours", y="Expression") #Label for axes
# add specific replicate lines 
for (i in 1:num_reps){
  p <- p +
    geom_line(data = ribbon.df,
              aes_string(x="Times",y=paste("Rep",i,sep = ".")),
              colour=color_bar[i])
}

# add Fit line
p <- p +
  geom_line(data = ribbon.df,
            aes_string(x="Times",y="Fit"),
            colour="black")

suppressWarnings(p) # to ignore warnings for missing values
# print sample's parameters
cat(paste0("Gene Name: ",results$`Gene Name`[samp],"\n",
           "Convergence:", results$Convergence[samp],"\n",
           "Iterations:",results$Iterations[samp],"\n",
           "Forcing Coefficient:", results$Forcing.Coefficient[samp],"\n",
           "Oscillation Type:",results$`Oscillation Type`[samp],"\n",
           "Amplitude", results$Amplitude[samp],"\n",
           "Radian.Frequency:",results$Radian.Frequency[samp],"\n",
           "Period:",results$Period[samp],"\n",
           "Phase Shift:",results$`Phase Shift`[samp],"\n",
           "Hours Shifted:",results$`Hours Shifted`[samp],"\n",
           "P-Value:",results$`P-Value`[samp],"\n",
           "BH Adj P-Value:",results$`BH Adj P-Value`[samp],"\n",
           "BY Adj P-Value:",results$`BY Adj P-Value`[samp],"\n"))


