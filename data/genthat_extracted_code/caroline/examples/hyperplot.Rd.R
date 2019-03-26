library(caroline)


### Name: hyperplot
### Title: Annotate Outliers in a Scatterplot via an HTML Image-Map
### Aliases: hyperplot

### ** Examples


if(capabilities()["png"] && interactive()) {

main.hov <- 'Hover over a point to see the name'
main.subsets <- '(annotated subset in red only)'
main.click.in <- 'click on points to visit table'
main.click.out <-  'click on points to visit external site'
cols <- c('black','red')
ext.url <- 'http://cran.r-project.org'

################################
## x and y as numeric vectors ##
################################
x.out <- nv(rnorm(13,2,sd=5),toupper(letters)[1:13])
x.in <- nv(rnorm(13,1,sd=.5),toupper(letters)[14:26])
y.out <- nv(rnorm(13,2,sd=5),toupper(letters)[1:13])
y.in <- nv(rnorm(13,1,sd=.5),toupper(letters)[14:26])
x <- c(x.out, x.in)
y <- c(y.out, y.in)

## simplest version
hyperplot(x,y, main=main.hov)

## same but with annotations being supplied as a paramter (instead of names on x)
names(x) <- NULL
hyperplot(x,y, annout=toupper(letters), main=main.hov)

## annotate only a subset 
hyperplot(x,y, annout=1:13, col=cols[rep(c(T,F), each=13)+1],
  main=paste(main.hov,main.subsets,sep='\n'))


########################
## annout as dataframe #
########################
## x and y as vectors 
x <- nv(x,toupper(letters)) # reinstate the names of x
df <- data.frame(ab=rep(c('a','b'),13),row.names=toupper(letters))
hyperplot(x,y, annout=df, 
                main=paste(main.hov, main.click.in, sep='\n'))

## x and y as names of columns in df
df <- cbind.data.frame(data.frame(x=x, y=y), df)
hyperplot(x='x',y='y', annout=df, 
                main=paste(main.hov, main.click.in, sep='\n'))

## using 'link' column name parameter to specify external links
df <- cbind.data.frame(df, 
            data.frame(url=ext.url, stringsAsFactors=FALSE))
hyperplot(x='x',y='y', annout=df, link='url', 
                main=paste(main.hov, main.click.out,sep='\n'))

## using reserved column name 'out' as a way to annotate a subset
df <- cbind.data.frame(df, data.frame(out=rep(c(TRUE,FALSE), each=13)))
hyperplot(x='x',y='y', annout=df, col=cols[df$out+1], 
                main=paste(main.hov, main.click.in, main.subsets,sep='\n'))



}




