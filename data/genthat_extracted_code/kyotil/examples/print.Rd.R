library(kyotil)


### Name: print.functions
### Title: Print Functions
### Aliases: formatInt formatDouble make.latex.coef.table mytex mytex.begin
###   mytex.end mywrite mywrite.csv roundup

### ** Examples


roundup (3.1, 2) # 3.10

formatInt(3, 2) # 03


## Not run: 
##D  
##D 
##D # demo of dimnames
##D tab=diag(1:4); rownames(tab)<-colnames(tab)<-1:4; names(dimnames(tab))=c("age","height")
##D # for greek letter in the labels, we need sanitize.text.function=identity
##D rownames(tab)[1]="$\alpha$"
##D # note that to use caption, floating needs to be TRUE
##D mytex (tab, file="tmp1", sanitize.text.function=identity, 
##D     caption="This is a caption .........................", caption.placement="top",
##D     floating=TRUE)
##D 
##D # col.headers has to have the RIGHT number of columns 
##D # but align is more flexible, may not need to include the rownames col
##D tab=diag(1:4); rownames(tab)<-colnames(tab)<-1:4
##D mytex (tab, file="tmp", include.rownames = TRUE, 
##D     align=c("c","c","c|","c","c"), col.headers=
##D     "\hline\n & \multicolumn{2}{c|}{Vaccine} & \multicolumn{2}{c}{Control} \\ \n")
##D # not include rownames
##D mytex (tab, file="tmp", include.rownames = FALSE, 
##D     align=c("c","c","c|","c","c"), col.headers=
##D     "\hline\n     \multicolumn{2}{c|}{Vaccine} & \multicolumn{2}{c}{Control} \\ \n") 
##D # It should work even if some rownames are duplicated
##D tab=diag(1:4); rownames(tab)=rep(1,4); colnames(tab)<-1:4
##D mytex (tab, file="tmp", include.rownames = TRUE, 
##D     align=c("c","c|","c","c"), col.headers=
##D     "\hline\n & \multicolumn{2}{c|}{Vaccine} & \multicolumn{2}{c}{Control} \\ \n") 
##D 
##D 
##D # add.to.rows
##D tab=diag(1:4); rownames(tab)<-1:4; colnames(tab)<-c("a","b","c","d")
##D mytex (tab, file="tmp",
##D     add.to.row=list( list(0,2),
##D         c("          \multicolumn{5}{l}{Heading 1} \\ \n",
##D           "\hline\n \multicolumn{5}{l}{Heading 2}\\ \n"
##D     ))
##D )
##D 
##D 
## End(Not run)






