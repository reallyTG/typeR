## ------------------------------------------------------------------------
library(fcm)

## ------------------------------------------------------------------------
act.vec <- data.frame(1, 1, 1, 0, 0, 0)    # Create the activation vector
colnames(act.vec) <- c("C1", "C2", "C3", "C4", "C5", "C6")  # Change the column names

C1 = c(0.0, 0.0, 0.6, 0.9, 0.0, 0.0)
C2 = c(0.1, 0.0, 0.0, 0.0, 0.0, 0.0)
C3 = c(0.0, 0.7, 0.0, 0.0, 0.9, 0.0)
C4 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.9)
C5 = c(0.0, 0.0, 0.0, 0.0, 0.0, -0.9)
C6 = c(-0.3, 0.0, 0.0, 0.0, 0.0, 0.0)


w.mat <- matrix(c(C1, C2, C3, C4, C5, C6), nrow =6, ncol=6, byrow=TRUE)   # Create the weight matrix
w.mat <- as.data.frame(w.mat)    # Transform w.mat as a dataframe
colnames(w.mat) <- c("C1", "C2", "C3", "C4", "C5", "C6") 
w.mat       # View the weight matrix

## ------------------------------------------------------------------------
output1 <- fcm.infer(act.vec, w.mat)

## ------------------------------------------------------------------------
output2 <- fcm.infer(act.vec, w.mat, 35, "r", "s", lambda = 2, e = 0.0001)
output2$values          # View the concepts' values for each iteration

## ------------------------------------------------------------------------
# load the libraries
library (reshape2)
library (ggplot2)

## ------------------------------------------------------------------------
iterations <- as.numeric(rownames(output1$values))  # create a numeric vector named "iterations"
df <- data.frame(iterations, output1$values)   # add "iterations" in the "output1$values" dataframe
df2 <- melt(df, id="iterations")              # transform the dataframe df into long formats
ggplot(data=df2,                              # Visualize the concepts' values 
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)


## ------------------------------------------------------------------------
iterations <- as.numeric(rownames(output2$values))  
df <- data.frame(iterations, output2$values)   
df2 <- melt(df, id="iterations")              
ggplot(data=df2,
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)


