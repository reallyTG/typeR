library(dprint)


### Name: dprint
### Title: Print Table to Graphics Device (dprint)
### Aliases: dprint

### ** Examples

### Generate Sample Data Structures ###
# Generate some example data frames
table1   <- rdesc(4, 5)        # Numeric
table1f <- rdesc(4, 5, rnd=TRUE) # Rounded and pretty format so values are character
table1a <- table1; table1b<-table1;
table1a$group2 <- 1; table1b$group2 <- 2;
table2 <- rbind(table1a, table1b)
table2a <- table2; table2b<-table2
table2a$group3 <- "Zebra"; table2b$group3 <- "Elephant";
table3 <- rbind(table2a, table2b)
# Create style object
CBs <- style(frmt.bdy=frmt(fontfamily="HersheySans"), frmt.tbl=frmt(bty="o", lwd=1),
            frmt.col=frmt(fontfamily="HersheySans", bg="khaki",fontface="bold",lwd=2,bty="_"),
            frmt.grp=frmt(fontfamily="HersheySans",bg="khaki", fontface="bold"),
            frmt.main=frmt(fontfamily="HersheySans", fontface="bold", fontsize=12),
            frmt.ftn=frmt(fontfamily="HersheySans"),
            justify="right")

# dev.new()# All variables, no group or label
dprint(~., data=table1f)
dev.off()
# dev.new() # Spanning,  group level, and apply control and treatments to hierchaies on right
dprint(group+level~Control:(Mean1 + Median1 + Variance1) +
 Treatment:(Mean2 + Median2 + Variance2) + p.value, data=table1f)
dev.off()
# dev.new(); #Illegal Names, remove expression
dprint(group+level~`This is a Control`:(Mean1 + Median1 + Variance1) +
 Treatment.y:(Mean2 + Median2 + Variance2), data=table1f, regx="1|2|.y")
dev.off()
# dev.new(); #Illegal Names, no group label
dprint( ~ `This is a Control`:(Mean1 + Median1 + Variance1) + 
Treatment.y:(Mean2 + Median2 + Variance2), data=table1f, regx="1|2|.y")
# dev.new(); # all on rhs with exception of p.value
dev.off()
dprint(group+level~.-p.value, data=table1f)
dev.off()
## Not run: 
##D # dev.new();
##D dprint(fmla=group+level~., data=table1)
##D dev.off()
##D # dev.new()
##D dprint(fmla=group+level~Rn(round(Mean1, 2), "Mean Trt")+Rn(round(Variance1,2), "Variance"), 
##D data=table1)
##D dev.off()
##D # dev.new()
##D dprint(group+level~Rn(round(Mean1, 2), "Mean Trt")+
##D Variance1+Rn(round(I((Mean1+Mean2)/2),2), "Average of Averages"), data=table1, main="Don't Do this")
##D dev.off()
##D # dev.new()
##D dprint(level~.|group2, data=table2)
##D dev.off()
##D # dev.new();
##D dprint(level~Mean1+Median2|group2, data=table2, main="Descriptives")
##D dev.off()
##D # dev.new(); # Spanning, embedded fuctions, and conditional
##D dprint(group+level~Treatment:Rn(paste(round(Mean1, 2),"(", round(Variance1, 2),")"),
##D  "Mean Trt (Std)")|group2, data=table2)
##D dev.off()
##D # dev.new(); # Spanning, embedded fuctions, and conditional
##D dprint(~Treatment:Rn(paste(round(Mean1, 2),"(", round(Variance1, 2),")"), 
##D "Mean Trt (Std)")|group2, data=table2)
##D # dev.new(); # Spanning, embedded fuctions, and conditional
##D dev.off()
##D dprint(~Treatment:(Rn(paste(round(Mean1, 2),"(", round(Variance1, 2),")"), "Mean Trt (Std)")+
##D Rn(round(Median1,2), "Median"))|group2, data=table2)
##D dev.off()
##D # dev.new()
##D dprint(~Treatment:Rn(paste(round(Mean1, 2),"(", round(Variance1, 2),")"), "Mean Trt (Std)")+
##D Control:Rn(paste(round(Mean2, 2),"(", round(Variance2, 2),")"), "Mean Trt (Std)")|group2,
##D  data=table2)
##D dev.off()
##D 
##D f1 <- group+level~Treatment:Rn(Fc(Mean1, Variance1), "Mean (Std)")+
##D Control:Rn(Fc(Mean2, Variance2), "Mean (Std)") + Rn(round(p.value,2), "P-value")
##D # dev.new()
##D dprint(fmla=f1, data=table1,margins=.2, main="Justify Center")
##D dev.off()
##D # dev.new()
##D dprint(fmla=f1, data=table1,margins=.2, main="Justify Right", 
##D style=style(justify="right", frmt.tbl=frmt(bty="o")))
##D dev.off()
##D # dev.new()
##D dprint(fmla=f1, data=table1,margins=.2, main="Justify Left", 
##D style=style(justify="left", frmt.tbl=frmt(bty="o")))
##D dev.off()
##D 
##D  h <- expression(hdr("Test Header", 
##D  pagelayout.obj=pagelayout(dtype="rgraphics", margins=c(1, .5))))
##D  f <- expression(ftr("R Package tabulaR", 
##D  pagelayout.obj=pagelayout(dtype="rgraphics", margins=c(1.25, 1, 1.25,1)), 
##D  pagenum=eval.parent(pagenum, 1)))
##D  # dev.new()
##D  dprint(fmla=f1, data=table1,margins=c(1.25, 1, 1.25,1), showmargins=TRUE, main="Table Left",
##D             style=style(justify="left", frmt.tbl=frmt(bty="o"), 
##D            frmt.bdy=frmt(linespace=1.5, bty="X")),
##D             f.hdr = h, f.ftr=f, pagenum=1)
##D dev.off()
##D 
##D # dev.new()
##D  dprint(fmla=f1, data=table1,margins=c(1.25, 1, 1.25,1), showmargins=TRUE, main="Table Left",
##D             style=CBs,
##D             f.hdr = h, f.ftr=f, pagenum=1)
##D  dev.new()
##D  by_var_f1 <- level~Mean1+Median1|group
##D  by_var_f2 <- level~Mean1+Median1|group+group2
##D # If main is default (null) than do not print titles
##D  dprint(fmla=by_var_f1, data=table2)
##D  dev.off()
##D # dev.new()
##D # When a title is defined, and only one conditional variable is defined, just print the values
##D # concatenated to the text
##D dprint(fmla=by_var_f1, data=table2,main=" ")
##D dev.off()
##D # dev.new()
##D # When more than one conditional variable, concatenate the variable name and the
##D # current combination of values
##D dprint(fmla=by_var_f2, data=table2,main="Descriptives for: ")    
## End(Not run)



