## ----feedforward_plot,echo=F,fig.height=4,fig.width=7--------------------
par(mar=rep(0,4))
plot(c(0,10),c(0,10),type="n",
     # bty ="n",
     xlab ="", ylab= "",xaxt="n",yaxt="n")

text(x=0,y=9.75,labels="RNN unit feed forward",pos=4,cex=2)





symbols(x=5,y=5,rectangles = matrix(8,nrow=1,ncol=2),inches = F,add = T) # unit itself
text(x=c(0,0.5,10,9.25),y=c(8,0,8,10),
     labels = c(expression('h'[t-1]),expression('x'[t]),expression('h'[t]),expression('y'[t])))

symbols(x=c(4.5,5),y=rep(2.5,2),rectangles = matrix(c(0.45,0.6),nrow=2,ncol=2,byrow = T),inches = F,add = T) # weight matrix
text(x=c(4.5,5),y=rep(2.5,2),
     labels = c(expression('W'),expression('U'))
     ) # weight matrix

segments(x0=c(1),x1 = c(5),y0 = c(0),y1 = c(0)) # xt segment
arrows(x0=c(5),y0=rep(0,1),y1=rep(2.2,1),length = 0.1) # xt arrows

symbols(x=c(4.75),y=rep(4,1),circles = rep(0.15,1),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(4.75),y=rep(4,1),labels="+") # addition of the weight matrix from x and hidden

symbols(x=c(4.75),y=c(rep(5,1)),rectangles = matrix(c(1,0.5),nrow=1,ncol=2,byrow = T),inches = F,add = T) # linearisation
text(x=c(4.75),y=c(rep(5,1)),labels=c("sigmoid")) # linearisation


# 

# 

# # arrows(x0)
# 
segments(x0=c(1.25),x1 = c(1.25),y0 = c(8),y1 = c(1.5)) # ht-1 segment
segments(x0=c(1.25),x1 = c(4.5),y0 = c(1.5),y1 = c(1.5)) # ht-1 segment
# 

arrows(x0=c(4.5),y0=rep(1.5,1),y1=rep(2.2,1),length = 0.1) # ht-1 arrows
# 
arrows(x0=c(4.5,5),x1=c(4.5,5)+c(0.1,-0.1),y0=rep(2.8,2),y1=rep(3.85,2),length = 0.1) # before addition arrows
# 
arrows(x0=c(4.75),x1=c(4.75),y0=rep(4.3,1),y1=rep(4.75,1),length = 0.1) # before linearisation
# 
arrows(x0=c(4.75),x1=c(9.75),y0=rep(8,1),length = 0.1) # h t-1 to ht arrows
segments(x0=c(0.5),x1=c(1.25),y0=rep(8,1)) # h t-1 to ht arrows
# 
segments(x0=c(4.75),y0=rep(5.25,1),y1=c(8))# after linearisation
# 
# 
# # 
arrows(x0=c(9.25),y0=c(8),y1=c(9.5),length = 0.1) # after X
# 

## ----BPTT plot,fig.height=5,fig.width=7,echo=F---------------------------
par(mar=rep(0,4))
plot(c(0,10),c(0,10),type="n",
     # bty ="n",
     xlab ="", ylab= "",xaxt="n",yaxt="n")

text(x=0,y=9.75,labels="RNN unit feed forward",pos=4,cex=2)





symbols(x=5,y=5,rectangles = matrix(8,nrow=1,ncol=2),inches = F,add = T) # unit itself
text(x=c(0,0.5,10,9.25),y=c(8,0,8,10),
     labels = c(expression('h'[t-1]),expression('x'[t]),expression('h'[t]),expression('y'[t])))

symbols(x=c(4.5,5),y=rep(2.5,2),rectangles = matrix(c(0.45,0.6),nrow=2,ncol=2,byrow = T),inches = F,add = T) # weight matrix
text(x=c(4.5,5),y=rep(2.5,2),
     labels = c(expression('W'),expression('U'))
     ) # weight matrix

segments(x0=c(1),x1 = c(5),y0 = c(0),y1 = c(0)) # xt segment
arrows(x0=c(5),y0=rep(0,1),y1=rep(2.2,1),length = 0.1) # xt arrows

symbols(x=c(4.75),y=rep(4,1),circles = rep(0.15,1),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(4.75),y=rep(4,1),labels="+") # addition of the weight matrix from x and hidden

symbols(x=c(4.75),y=c(rep(5,1)),rectangles = matrix(c(1,0.5),nrow=1,ncol=2,byrow = T),inches = F,add = T) # linearisation
text(x=c(4.75),y=c(rep(5,1)),labels=c("sigmoid")) # linearisation


# 

# 

# # arrows(x0)
# 
segments(x0=c(1.25),x1 = c(1.25),y0 = c(8),y1 = c(1.5)) # ht-1 segment
segments(x0=c(1.25),x1 = c(4.5),y0 = c(1.5),y1 = c(1.5)) # ht-1 segment
# 

arrows(x0=c(4.5),y0=rep(1.5,1),y1=rep(2.2,1),length = 0.1) # ht-1 arrows
# 
arrows(x0=c(4.5,5),x1=c(4.5,5)+c(0.1,-0.1),y0=rep(2.8,2),y1=rep(3.85,2),length = 0.1) # before addition arrows
# 
arrows(x0=c(4.75),x1=c(4.75),y0=rep(4.3,1),y1=rep(4.75,1),length = 0.1) # before linearisation
# 
arrows(x0=c(4.75),x1=c(9.75),y0=rep(8,1),length = 0.1) # h t-1 to ht arrows
segments(x0=c(0.5),x1=c(1.25),y0=rep(8,1)) # h t-1 to ht arrows
# 
segments(x0=c(4.75),y0=rep(5.25,1),y1=c(8))# after linearisation
# 
# 
# # 
arrows(x0=c(9.25),y0=c(8),y1=c(9.5),length = 0.1) # after X
# 

text(x = c(9.25), y = c(9.25), labels=c(expression(delta~"1")), pos=4,cex=0.8)
text(x = c(9.75), y = c(8), labels=c(expression(delta~"2")), pos=3,cex=0.8)

text(x = c(7), y = c(8), labels=c(expression(delta~"3")), pos=3,cex=0.8)
text(x = c(4.75), y = c(4.35), labels=c(expression(delta~"4")), pos=4,cex=0.8)
text(x = c(4.75)+0.2, y = c(4.35)-1, labels=c(expression(delta~"4")), pos=4,cex=0.8)

text(x = c(5)-0.1, y = c(0.5), labels=c(expression(delta~"5")), pos=4,cex=0.8)
text(x = c(4.5)-0.1, y = c(1.85), labels=c(expression(delta~"6")), pos=4,cex=0.8)
# 

text(x = 0.5, y = c(8), labels=c(expression(delta~"6")), pos=3,cex=0.8)
text(x = 1, y = 0, labels=c(expression(delta~"5")), pos=3,cex=0.8)

