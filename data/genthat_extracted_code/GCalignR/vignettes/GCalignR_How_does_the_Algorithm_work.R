## ---- echo = FALSE-------------------------------------------------------
library(knitr)
knitr::opts_chunk$set(collapse = TRUE, comment = ">", cache = FALSE,
    fig.width = 8, fig.height = 6, fig.align = "center") 

## ---- results='hide', echo=FALSE-----------------------------------------
library(GCalignR)
library(ggplot2)

## ---- fig.cap="Figure 1. A Chromatogram plots an intensity signal over the course of a separation run.", echo=F----
set.seed(123)
# create one chromatogram with specified peaks
df1 <- GCalignR:::simple_chroma(peaks = c(5.01,10.02,13.10,20.22,24.57), N = 1)
df1 <- subset(df1, x > 3.5 & x < 27)
# plot the chromatogram
chroma <- ggplot(data = df1, aes(x,y, fill = sample)) + geom_line(size = 1) + theme_classic() + xlab("Retention time ") + ylab("Intensity") + scale_x_continuous(breaks = seq(4,26,1),expand = c(0,0)) + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank()) 
chroma

## ---- echo=F, fig.cap="Figure 2. Chromatogram with integrated peaks"-----
# Using an internal function, peaks are detected by searching for global maxima
peaks <- find_peaks(df1) 
# create the plot
chroma + geom_linerange(data = peaks, aes(x = x, ymin = 0, ymax = y), linetype = "dashed", col = "black") + annotate("text", x = peaks[["x"]], y = peaks[["y"]] + 0.1, label = as.character(round(peaks[["y"]],2)), angle = 0) + geom_area(fill = "blue", alpha = 0.4) + theme(legend.position = "none")

## ---- echo=FALSE---------------------------------------------------------
# create a data frame that depicts a peak list
df <- data.frame(row.names = c("Peak 1", "Peak 2", "Peak 3", "Peak 4", "Peak 5"), time = peaks[["x"]], height = peaks[["y"]])
# print the table
knitr::kable(df,digits = 2)

## ---- results='hide', echo = FALSE, fig.cap="Figure 3. Overlay of Chromatograms from four samples"----
set.seed(123)
peak_list <- sample(x = seq(from = 1, to = 26, by = 4), size = 6, replace = F)
df <- GCalignR:::simple_chroma(peaks = peak_list, N = 4)
# draw chromatograms and display peaks
chroma <- ggplot(data = df, aes(x,y, col = sample)) + geom_line(size = 1) + theme_classic() + xlab("Retention time ") + ylab("Intensity") + scale_x_continuous(breaks = seq(0,30,5),expand = c(0,0)) + theme(axis.text.y = element_blank(), axis.ticks.y = element_blank(), legend.position = "bottom") + scale_color_brewer(palette = "Dark2") + guides(col = guide_legend(ncol = 4, title = NULL))

# peaks are in this case simply the local maxima for each sample
peaks <- find_peaks(df)
chroma <- chroma + geom_linerange(data = peaks, aes(x = x, ymin = y, ymax = y + 0.1), linetype = "solid", col = "black") + annotate("text", x = peaks[["x"]], y = peaks[["y"]] + 0.2, label = as.character(round(peaks[["x"]],2)), angle = 90)
print(chroma)

## ---- echo = FALSE, results='hide', eval=FALSE---------------------------
#  ## these lines create a input file which is distributed with the package
#  # sink("ChromSimul.txt",append = FALSE)
#  ## write sample identifier
#  #cat(levels(peaks[["sample"]]),sep = "\t")
#  ## write variables
#  #cat(c("\nrt","height\n"),sep = "\t")
#  ## merge data horizontally
#  
#  #dat_mat <- numeric()
#  
#  #for (i in levels(peaks[["sample"]])) {
#   #   temp <- as.matrix(peaks[,c("x","y")][peaks[["sample"]] == i,])
#    #  add <-  max(summary(peaks[["sample"]])) - nrow(temp)
#     # temp <- rbind(temp, matrix(data = 0,nrow = add, ncol = 2))
#      #  dat_mat <- cbind(dat_mat, temp)
#  #}
#  #write.table(dat_mat, row.names = F, col.names = F, sep = "\t")
#  #sink()

## ---- echo = FALSE-------------------------------------------------------
## sample identifiers
cat(levels(peaks[["sample"]]),sep = "\t") 
## variable names
cat(c("\nrt","height\n"),sep = "\t") 

## empty matrix to fill with the data
dat_mat <- numeric()
for (i in levels(peaks[["sample"]])) {
    temp <- as.matrix(peaks[,c("x","y")][peaks[["sample"]] == i,])
    add <-  max(summary(peaks[["sample"]])) - nrow(temp)
    temp <- rbind(temp, matrix(data = 0,nrow = add, ncol = 2))
    dat_mat <- cbind(dat_mat, temp)
} 
## output the formatted matrix
write.table(round(dat_mat,2), row.names = F, col.names = F, sep = "\t")

## ---- eval = FALSE, echo = FALSE, fig.cap="Figure 4. Corrected linear drift between Reference and Focal sample at a shift of -1"----
#  ## Not executed for computational reasons. A warning is raised due to NAs in the data frame.
#  ## This is not an error.
#  
#  ### #########################
#  ### Create Chromatograms ####
#  ### #########################
#  width = 1.2 # scaling peaks width, i.e. standard deviation of gaussians
#  
#  # sample a, the reference
#  #########################
#  a <- data.frame(simple_chroma(peaks = c(5,10,16,20),
#                                N = 1,
#                                Names = "Sample A (Reference)",
#                                sd = c(0.30, 0.35, 0.24, 0.25, 0.23)*width),
#                  ym2 = NA,
#                  yp1 = NA)
#  # sample b
#  ###########
#  bx <- c(7.6,12.2,21.8) # a peak vector
#  b <- data.frame(simple_chroma(peaks = bx,
#                                N = 1,
#                                Names = "Sample B",
#                                sd = c(0.22, 0.28, 0.27)*width),
#                  ym2 = data.frame(simple_chroma(peaks = bx - 2, N = 1,
#                                                 Names = "Sample B",
#                                                 sd = c(0.22, 0.28, 0.27)*width))[["y"]],
#                  yp1 = NA)
#  # sample c
#  ###########
#  cx <- c(4.4,15.3,19.2) # a peak vector
#  c <- data.frame(simple_chroma(peaks = cx,
#                                N = 1,
#                                Names = "Sample C",
#                                sd = c(0.31, 0.29, 0.38)*width),
#                  yp1 = data.frame(simple_chroma(peaks = cx + 1, N = 1,
#                                                 Names = "Sample C",
#                                                 sd = c(0.31, 0.29, 0.38)*width))[["y"]],
#                  ym2 = NA)
#  
#  # merge data frame
#  ###################
#  df <- rbind(a,b,c)
#  df <- subset(df, x > 3 & x < 23.5) # define range of x
#  
#  # find peaks for each sample
#  ############################
#  peaks <- find_peaks(df[,1:3])
#  peaks2 <- peaks # set a a second frame in order to visualise the shifts
#  peaks2[["x"]][5:10] <- peaks2[["x"]][c(1,2,4,1,3,4)]
#  
#  # create data frame for annotations by arrows
#  arrow_df <- data.frame(subset(peaks, sample %in% c("Sample B","Sample C")))
#  arrow_df[["x2"]] <- arrow_df[["x"]] + rep(c(-1.85,0.85), each = 3)
#  
#  # create data frame for text annotations
#  tex <- rbind(peaks[5,], peaks[10,])
#  tex[["x"]] <- tex[["x"]] + c(-1, 0.5)
#  tex[["z"]] <- c("-2","+1")
#  
#  # define x axis ticks and labels
#  x.lab <- numeric()
#  x.tick <- seq(3,24,0.25)
#  for (i in seq(3,23,1)) {
#      t <- c(i, rep("",3))
#      x.lab <- c(x.lab, t)
#  }
#  x.lab <- c(x.lab,"")
#  
#  # create ggplot
#  chroma <- ggplot(data = df, aes(x,y, fill = sample)) + geom_line(size = 1.2, colour = "black") +
#      theme_classic(base_size = 12) + xlab("Retention time") + ylab("") +
#      scale_x_continuous(breaks = x.tick,expand = c(0,0), labels = x.lab) +
#      theme(axis.text.y = element_blank(), axis.ticks.y = element_blank(),
#            strip.background = element_rect(colour = "black", fill = "#CCCCFF"),
#            legend.position = "none") +
#      facet_wrap(~sample, ncol = 1) +
#      scale_fill_brewer(palette = "Set1") +
#      geom_area(alpha = 0.8) +
#      geom_line(aes(x = x, y = ym2), colour = "#377EB8", size = 0.8, linetype = "solid") +
#      geom_line(aes(x = x, y = yp1), colour = "#4DAF4A", size = 0.8, linetype = "solid") +
#      geom_area(aes(x = x, y = yp1), fill = "#4DAF4A", alpha = 0.2) +
#      geom_area(aes(x = x, y = ym2), fill = "#377EB8", alpha = 0.2) +
#      geom_segment(data = arrow_df, aes(x = x, y = y, xend = x2, yend = y), arrow = arrow(length = unit(0.1, "inches") ),
#                   size = 0.8, color = "black", linetype = "solid")
#  print(chroma)

## ---- echo = FALSE, fig.cap="Figure 4. Corrected linear drift between Reference and Focal sample at a shift of -1", out.width="600px"----
knitr::include_graphics(path = "Lin_Shift.png")

## ---- echo=FALSE, fig.cap="Figure 5. Alignment of individual peaks based on retention time matrices. Colours represent substances, black rectangles highlight causes of manipulations.",out.width = "750px"----
knitr::include_graphics("align_peaks.png",dpi = 300)

## ---- echo=FALSE, fig.cap="Figure 6. Merging redudant rows of homologous peaks.",out.width = "500px"----
knitr::include_graphics("merge_row.png",dpi = 300)

## ---- fig.cap="Figure 7. Chromatographic representation of the dataset prior to alignment", eval = FALSE----
#  ## path to the data
#  path <- system.file("extdata", "simulated_peak_data.txt", package = "GCalignR")
#  ## draw chromatograms
#  x <- draw_chromatogram(data = path, rt_col_name = "rt", show_rt = T, show_num = F, plot = F)
#  x[["ggplot"]] + geom_line(size = 1.2) + theme(axis.ticks.x = element_blank()) + ggplot2::scale_color_brewer(palette = "Dark2")

## ---- fig.cap="Figure 7. Chromatographic representation of the dataset prior to alignment", echo=FALSE----
knitr::include_graphics("chroma_not_aligned.png", dpi = 300)

## ---- eval=T, results="hide"---------------------------------------------
path <- system.file("extdata", "simulated_peak_data.txt", package = "GCalignR")
aligned <- align_chromatograms(data = path,
                               rt_col_name = "rt",
                               max_linear_shift = 1.6,
                               max_diff_peak2mean = 0.5,
                               min_diff_peak2peak = 1,
                               reference = "A2")

## ------------------------------------------------------------------------
print(aligned[["Logfile"]][["LinearShift"]])

## ---- fig.cap="Figure 8. Histogram of linear shifts."--------------------
plot(aligned, which_plot = "shifts")

## ---- results="hide", fig.cap="Figure 9. Correcting linear drift reduces the gaps between homologous peak retention times"----
x <- draw_chromatogram(data = aligned, rt_col_name = "rt", step = "shifted", show_rt = F, show_num = F, plot = F)
x[["ggplot"]] + ggplot2::scale_color_brewer(palette = "Dark2")

## ---- results="hide", fig.cap= "Figure 10. Aligned peaks are represented by the mean retention time of a substance "----
x <- draw_chromatogram(data = aligned, rt_col_name = "rt", step = "aligned", show_num = T, plot = F)
x[["ggplot"]] + ggplot2::scale_color_brewer(palette = "Dark2")

## ---- fig.cap="Figure 11. Suplots are a convenient means of visualising aligned peak lists"----
## for using ggplot2::facet_wrap we need to get rid of the annotations
x <- draw_chromatogram(data = aligned, rt_col_name = "rt", step = "aligned", show_num = F, plot = F)
x[["ggplot"]] + ggplot2::facet_wrap(~sample, ncol = 1) + ggplot2::scale_color_brewer(palette = "Dark2")

