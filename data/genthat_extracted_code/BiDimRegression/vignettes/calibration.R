## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----raw data, echo=TRUE, message=FALSE, warning=FALSE, fig.width= 5, out.width = "100%", fig.asp= 3/4, dpi = 200----
library(BiDimRegression)
library(dplyr)
library(ggplot2)

ggplot(data= EyegazeData, aes(x= x, y= y, color= target, fill= target)) +
  geom_point(data= EyegazeData %>% group_by(target, target_x, target_y) %>% summarise(),
             aes(x= target_x, y= target_y), shape= 21, size= 10, fill= 'white') + 
  geom_point(alpha= 0.5, shape= 21) + 
  ggtitle('Raw eye gaze')

## ----Adjust gaze, fig.width= 5, out.width = "100%", fig.asp= 3/4, dpi = 200----

lm2aff <- lm2(target_x + target_y ~ x + y,  EyegazeData, transformation = 'affine')
adjusted_gaze <- data.frame(predict(lm2aff))
colnames(adjusted_gaze) <- c('adjX', 'adjY')
adjusted_gaze <- cbind(EyegazeData, adjusted_gaze)


ggplot(data= adjusted_gaze, aes(x= adjX, y= adjY, color= target, fill= target)) +
  geom_point(data= adjusted_gaze %>% group_by(target, target_x, target_y) %>% summarise(),
             aes(x= target_x, y= target_y), shape= 21, size= 10, fill= 'white') + 
  geom_point(alpha= 0.5, shape= 21) + 
  xlab('x')+
  ylab('y')+
  ggtitle('Adjusted eye gaze')

