## ----feedforward_plot,echo=F,fig.height=4,fig.width=7--------------------
par(mar=rep(0,4))
plot(c(0,10),c(0,10),type="n",
     # bty ="n",
     xlab ="", ylab= "",xaxt="n",yaxt="n")

text(x=0,y=9.75,labels="GRU unit feed forward",pos=4,cex=2)





symbols(x=5,y=5,rectangles = matrix(8,nrow=1,ncol=2),inches = F,add = T) # unit itself
text(x=c(0,0.5,10,9.25),y=c(8,0,8,10),
     labels = c(expression('h'[t-1]),expression('x'[t]),expression('h'[t]),expression('y'[t])))

symbols(x=c(3,3.5,4.5,5,6,6.5),y=rep(2.5,6),rectangles = matrix(c(0.45,0.6),nrow=6,ncol=2,byrow = T),inches = F,add = T) # weight matrix
text(x=c(3,3.5,4.5,5,6,6.5),y=rep(2.5,6),
     labels = c(expression('W'[r]),expression('U'[r]),
                expression('W'[z]),expression('U'[z]),expression('W'[g]),expression('U'[g]))
     ) # weight matrix

segments(x0=c(1),x1 = c(6.5),y0 = c(0),y1 = c(0)) # xt segment
arrows(x0=c(3.5,5,6.5),y0=rep(0,3),y1=rep(2.2,3),length = 0.1) # xt arrows

symbols(x=c(3.25,4.75,6.25),y=rep(4,3),circles = rep(0.15,3),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(3.25,4.75,6.25),y=rep(4,3),labels="+") # addition of the weight matrix from x and hidden

symbols(x=c(3.25,4.75,6.25),y=c(rep(5,3)),rectangles = matrix(c(1,0.5),nrow=3,ncol=2,byrow = T),inches = F,add = T) # linearisation
text(x=c(3.25,4.75,6.25),y=c(rep(5,3)),labels=c("sigmoid","sigmoid","tanh")) # linearisation

symbols(x=c(1.75,4.75,4.75,6.25,6.25),y=c(6,8,7,6,8),circles = rep(0.15,5),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(1.75,4.75,4.75,6.25,6.25),y=c(6,8,7,6,8),labels=c("x","x","1-","x","+")) # addition of the weight matrix from x and hidden

# 

# 

# # arrows(x0)
# 
segments(x0=c(1.25),x1 = c(1.25),y0 = c(8),y1 = c(1.5)) # ht-1 segment
segments(x0=c(1.25),x1 = c(4.5),y0 = c(1.5),y1 = c(1.5)) # ht-1 segment
# 

arrows(x0=c(3,4.5),y0=rep(1.5,2),y1=rep(2.2,2),length = 0.1) # ht-1 arrows
arrows(x0=c(6),y0=rep(1.25,1),y1=rep(2.2,1),length = 0.1) # ht-1 arrows
# 
arrows(x0=c(3,3.5,4.5,5,6,6.5),x1=c(3,3.5,4.5,5,6,6.5)+c(0.1,-0.1),y0=rep(2.86),y1=rep(3.85,6),length = 0.1) # before addition arrows
# 
arrows(x0=c(3.25,4.75,6.25),x1=c(3.25,4.75,6.25),y0=rep(4.3,3),y1=rep(4.75,3),length = 0.1) # before linearisation
# 
arrows(x0=c(0.5,4.9,6.4),x1=c(4.6,6.1,9.75),y0=rep(8,2),length = 0.1) # h t-1 to ht arrows
# 
arrows(x0=c(1.75),y0=rep(8,1),y1=c(6.3),length = 0.1)# after linearisation
segments(x0=c(1.75),y0=rep(5.7),y1=c(1.25))# after linearisation
segments(x0=c(1.75),x1 = 6,y0=c(1.25))# after linearisation
arrows(x0=c(4.75),y0=rep(5.25,1),y1=c(6.75),length = 0.1)# after linearisation


segments(x0=c(3.25),y0=c(5.25),y1=c(6))# after linearisation
arrows(x0=c(6.25),y0=c(5.25),y1=c(5.7),length = 0.1)# after linearisation

arrows(x0=c(4.75),y0=c(7.3),y1=c(7.7),length = 0.1) # still still after linearisation
# 
arrows(x0=c(3.25,4.75),x1=c(1.9,6.1),y0=c(6,6),length = 0.1) # still after linearisation
# 
arrows(x0=c(6.25),y0=c(6.3),y1=c(7.7),length = 0.1)# after linearisation
# 
arrows(x0=c(9.25),y0=c(8),y1=c(9.5),length = 0.1) # after X
# 
text(x=c(3.25,4.75,6.25),y=5.5,labels=c(expression('r'[t]),expression('z'[t]),expression('g'[t])),pos = 4)

## ----BPTT plot,fig.height=5,fig.width=7,echo=F---------------------------
par(mar=rep(0,4))
plot(c(0,10),c(0,10),type="n",
     # bty ="n",
     xlab ="", ylab= "",xaxt="n",yaxt="n")

text(x=0,y=9.75,labels="GRU unit back propagation",pos=4,cex=2)





symbols(x=5,y=5,rectangles = matrix(8,nrow=1,ncol=2),inches = F,add = T) # unit itself
text(x=c(0,0.5,10,9.25),y=c(8,0,8,10),
     labels = c(expression('h'[t-1]),expression('x'[t]),expression('h'[t]),expression('y'[t])))

symbols(x=c(3,3.5,4.5,5,6,6.5),y=rep(2.5,6),rectangles = matrix(c(0.45,0.6),nrow=6,ncol=2,byrow = T),inches = F,add = T) # weight matrix
text(x=c(3,3.5,4.5,5,6,6.5),y=rep(2.5,6),
     labels = c(expression('W'[r]),expression('U'[r]),
                expression('W'[z]),expression('U'[z]),expression('W'[g]),expression('U'[g]))
     ) # weight matrix

arrows(x1=c(1),x0 = c(6.5),y0 = c(0),y1 = c(0),length = 0.1) # xt segment
arrows(x0=c(3.5,5,6.5),y1=rep(0,3),y0=rep(2.2,3),length = 0.1) # xt arrows

symbols(x=c(3.25,4.75,6.25),y=rep(4,3),circles = rep(0.15,3),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(3.25,4.75,6.25),y=rep(4,3),labels="+") # addition of the weight matrix from x and hidden

symbols(x=c(3.25,4.75,6.25),y=c(rep(5,3)),rectangles = matrix(c(1,0.5),nrow=3,ncol=2,byrow = T),inches = F,add = T) # linearisation
text(x=c(3.25,4.75,6.25),y=c(rep(5,3)),labels=c("sigmoid","sigmoid","tanh")) # linearisation

symbols(x=c(1.75,4.75,4.75,6.25,6.25),y=c(6,8,7,6,8),circles = rep(0.15,5),inches = F,add = T) # addition of the weight matrix from x and hidden
text(x=c(1.75,4.75,4.75,6.25,6.25),y=c(6,8,7,6,8),labels=c("x","x","1-","x","+")) # addition of the weight matrix from x and hidden

# # arrows(x0)
# 
arrows(x0=c(1.25),x1 = c(1.25),y1 = c(8),y0 = c(1.5),length = 0.1) # ht-1 segment
segments(x1=c(1.25),x0 = c(4.5),y0 = c(1.5),y1 = c(1.5)) # ht-1 segment
# 

arrows(x0=c(3,4.5),y1=rep(1.5,2),y0=rep(2.2,2),length = 0.1) # ht-1 arrows
arrows(x0=c(6),y1=rep(1.25,1),y0=rep(2.2,1),length = 0.1) # ht-1 arrows
# 
arrows(x1=c(3,3.5,4.5,5,6,6.5),x0=c(3,3.5,4.5,5,6,6.5)+c(0.1,-0.1),y1=rep(2.86),y0=rep(3.85,6),length = 0.1) # before addition arrows
# 
arrows(x1=c(3.25,4.75,6.25),x0=c(3.25,4.75,6.25),y1=rep(4.3,3),y0=rep(4.75,3),length = 0.1) # before linearisation
# 
arrows(x1=c(0.5,4.9,6.4),x0=c(4.6,6.1,9.75),y0=rep(8,2),length = 0.1) # h t-1 to ht arrows
# 
arrows(x0=c(1.75),y1=rep(8,1),y0=c(6.3),length = 0.1)# after linearisation
segments(x0=c(1.75),y1=rep(5.7),y0=c(1.25))# after linearisation
segments(x1=c(1.75),x0 = 6,y0=c(1.25))# after linearisation
arrows(x0=c(4.75),y1=rep(5.25,1),y0=c(6.75),length = 0.1)# after linearisation


arrows(x0=c(3.25),y1=c(5.25),y0=c(6),length = 0.1)# after linearisation
arrows(x0=c(6.25),y1=c(5.25),y0=c(5.7),length = 0.1)# after linearisation

arrows(x0=c(4.75),y1=c(7.3),y0=c(7.7),length = 0.1) # still still after linearisation
# 
arrows(x1=c(4.75),x0=c(6.1),y0=c(6),length = 0.1) # still after linearisation
segments(x1=c(3.25),x0=c(1.9),y0=c(6)) # still after linearisation
# 
arrows(x0=c(6.25),y1=c(6.3),y0=c(7.7),length = 0.1)# after linearisation
# 
arrows(x0=c(9.25),y1=c(8),y0=c(9.5),length = 0.1) # after X
# 
text(x=c(3.25,4.75,6.25),y=5.5,labels=c(expression('r'[t]),expression('z'[t]),expression('g'[t])),pos = 2)

text(x = c(9.25), y = c(9.25), labels=c(expression(delta~"1")), pos=4,cex=0.8)
text(x = c(9.75), y = c(8), labels=c(expression(delta~"2")), pos=3,cex=0.8)

text(x = c(6.25), y = c(7), labels=c(expression(delta~"3")), pos=4,cex=0.8)
text(x = c(7), y = c(8), labels=c(expression(delta~"3")), pos=3,cex=0.8)
text(x = c(5.5), y = c(8), labels=c(expression(delta~"3")), pos=3,cex=0.8)

text(x = c(4), y = c(8), labels=c(expression(delta~"4")), pos=3,cex=0.8)
text(x = c(4.75), y = c(7.55), labels=c(expression(delta~"5")), pos=4,cex=0.8)

text(x = c(4.75), y = c(6.5), labels=c(expression(delta~"6")), pos=4,cex=0.8)

text(x = c(5.75), y = c(6), labels=c(expression(delta~"7")), pos=3,cex=0.8)
text(x = c(6.25), y = c(5.5), labels=c(expression(delta~"8")),pos = 4,cex=0.8)
text(x = c(4.75), y = c(5.5), labels=c(expression(delta~"9")),pos = 4,cex=0.8)

text(x = c(6.25), y = c(4.35), labels=c(expression(delta~"10")), pos=4,cex=0.8)
text(x = c(6.25)+0.2, y = c(4.35)-1, labels=c(expression(delta~"10")), pos=4,cex=0.8)
text(x = c(4.75), y = c(4.35), labels=c(expression(delta~"11")), pos=4,cex=0.8)
text(x = c(4.75)+0.2, y = c(4.35)-1, labels=c(expression(delta~"11")), pos=4,cex=0.8)


text(x = c(6.5)-0.1, y = c(0.5), labels=c(expression(delta~"12")), pos=4,cex=0.8)
text(x = c(6)-0.1, y = c(1.85), labels=c(expression(delta~"13")), pos=4,cex=0.8)
text(x = c(5)-0.1, y = c(0.5), labels=c(expression(delta~"14")), pos=4,cex=0.8)
text(x = c(4.5)-0.1, y = c(1.85), labels=c(expression(delta~"15")), pos=4,cex=0.8)

text(x = c(1.75), y = c(4.35), labels=c(expression(delta~"13")), pos=4,cex=0.8)

text(x = c(2.75), y = c(6), labels=c(expression(delta~"16")), pos=3,cex=0.8)
text(x = c(1.75), y = c(7), labels=c(expression(delta~"17")), pos=4,cex=0.8)

text(x = c(3.25), y = c(4.35), labels=c(expression(delta~"18")), pos=4,cex=0.8)
text(x = c(3.25)+0.2, y = c(4.35)-1, labels=c(expression(delta~"18")), pos=4,cex=0.8)

text(x = 1.5, y = c(8), labels=c(expression(delta~"19")), pos=3,cex=0.8)

text(x = c(3.5)-0.1, y = c(0.5), labels=c(expression(delta~"20")), pos=4,cex=0.8)
text(x = c(3)-0.1, y = c(1.85), labels=c(expression(delta~"21")), pos=4,cex=0.8)


text(x = 2.25, y = 1.5, labels=c(expression(delta~"22")), pos=3,cex=0.8)

text(x = 0.5, y = c(8), labels=c(expression(delta~"23")), pos=3,cex=0.8)
text(x = 1, y = 0, labels=c(expression(delta~"24")), pos=3,cex=0.8)

