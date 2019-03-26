library(fcm)


### Name: fcm.infer
### Title: Inference of Fuzzy Cognitive Maps (FCMs)
### Aliases: fcm.infer

### ** Examples

## Not run: 
##D # Example for the FCM inference with 8 nodes
##D 
##D 
##D ### Input data
##D 
##D # Create the activation vector
##D act.vec <- data.frame(1, 1, 0, 0, 0, 0, 0, 0)
##D # Change the column names
##D colnames(act.vec) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8")
##D 
##D C1 = c(0.0, 0.0, 0.6, 0.9, 0.0, 0.0, 0.0, 0.8)
##D C2 = c(0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.5)
##D C3 = c(0.0, 0.7, 0.0, 0.0, 0.9, 0.0, 0.4, 0.1)
##D C4 = c(0.4, 0.0, 0.0, 0.0, 0.0, 0.9, 0.0, 0.0)
##D C5 = c(0.0, 0.0, 0.0, 0.0, 0.0, -0.9, 0.0, 0.3)
##D C6 = c(-0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
##D C7 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.4, 0.9)
##D C8 = c(0.1, 0.0, 0.0, 0.0, 0.0, 0.1, 0.6, 0.0)
##D 
##D # Create the weight matrix
##D w.mat <- matrix(c(C1, C2, C3, C4, C5, C6, C7, C8),
##D                 nrow = 8, ncol = 8, byrow = TRUE)
##D colnames(w.mat) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8")
##D w.mat <- as.data.frame(w.mat)
##D 
##D 
##D 
##D ### Select the arguments for the fcm.infer function
##D 
##D output <- fcm.infer(act.vec, w.mat, 50, "r", "s")
##D View(output$values)   # View the concept values for each iteration
##D 
##D 
##D ### Visualize the concepts' values for each state
##D 
##D library (reshape2)
##D library (ggplot2)
##D # create a numeric vector named "iterations"
##D iterations <- as.numeric(rownames(output$values))
##D # add "iterations" in the "output$values" dataframe
##D df <- data.frame(iterations, output$values)
##D #transform df into long formats
##D df2 <- melt(df, id="iterations")
##D ggplot(data=df2,
##D        aes(x=iterations, y=value, group=variable, colour=variable)) +
##D        theme_bw() + geom_line(size=0.7) + geom_point(size = 2)
## End(Not run)

## Don't show: 
# Example 1 for the FCM inference with 7 nodes


### Input data
library(fcm)
# Create the activation vector
act.vec <- data.frame(1, 1, 0, 0, 0, 0, 0)
# Change the column names
colnames(act.vec) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7")

C1 = c(0.0, 0.0, 0.6, 0.9, 0.0, 0.0, 0.0)
C2 = c(0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2)
C3 = c(0.0, 0.7, 0.0, 0.0, 0.9, 0.0, 0.4)
C4 = c(0.4, 0.0, 0.0, 0.0, 0.0, 0.9, 0.0)
C5 = c(0.0, 0.0, 0.0, 0.0, 0.0, -0.9, 0.0)
C6 = c(-0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
C7 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.4)

# Create the weight matrix
w.mat <- matrix(c(C1, C2, C3, C4, C5, C6, C7),
                nrow = 7, ncol = 7, byrow = TRUE)
colnames(w.mat) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7")
w.mat <- as.data.frame(w.mat)



### Select the arguments for the fcm.infer function

output <- fcm.infer(act.vec, w.mat, 25, "rc", "s", , 0.0001)


### Visualize the concepts' values for each state

library (reshape2)
library (ggplot2)
# create a numeric vector named "iterations"
iterations <- as.numeric(rownames(output$values))
# add "iterations" in the "output$values" dataframe
df <- data.frame(iterations, output$values)
#transform df into long formats
df2 <- melt(df, id="iterations")
ggplot(data=df2,
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)
## End(Don't show)

## Don't show: 
# Example 2 for the FCM inference with 5 nodes


### Input data
library(fcm)
# Create the activation vector
act.vec2 <- data.frame(1, 0, 0, 0, 0)
# Change the column names
colnames(act.vec2) <- c("C1", "C2", "C3", "C4", "C5")

C1 = c(0.0, 0.0, 0.6, 0.9, 0.0)
C2 = c(0.3, 0.0, 0.0, 0.7, 0.0)
C3 = c(0.0, 0.7, 0.0, 0.0, 0.9)
C4 = c(0.0, 0.6, 0.0, 0.0, 0.0)
C5 = c(0.2, 0.4, 0.0, 0.0, 0.0)

# Create the weight matrix
w.mat2 <- matrix(c(C1, C2, C3, C4, C5),
                nrow = 5, ncol = 5, byrow = TRUE)
colnames(w.mat2) <- c("C1", "C2", "C3", "C4", "C5")
w.mat2 <- as.data.frame(w.mat2)


### Select the arguments for the fcm.infer function
output2 <- fcm.infer(act.vec2, w.mat2, 10, "k", "tr")


### Visualize the concepts' values for each state

library (reshape2)
library (ggplot2)
# create a numeric vector named "iterations"
iterations <- as.numeric(rownames(output2$values))
# add "iterations" in the "output2$values" dataframe
df2 <- data.frame(iterations, output2$values)
#transform df into long formats
df2b <- melt(df2, id="iterations")
ggplot(data=df2b,
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)
## End(Don't show)



