library(tnet)


### Name: as.static.tnet
### Title: Transform a longitudinal network to a static edgelist network
### Aliases: as.static.tnet

### ** Examples

t <- c('2007-09-12 13:45:00', 
'2007-09-12 13:46:31',
'2007-09-12 13:47:54',
'2007-09-12 13:48:21',
'2007-09-12 13:49:27',
'2007-09-12 13:58:14',
'2007-09-12 13:52:17',
'2007-09-12 13:56:59');
i <- c(1,1,1,1,1,1,1,1);
j <- c(2,2,2,2,2,2,3,3);
w <- c(1,1,1,1,1,-1,1,1);
net <- data.frame(t, i, j, w);

## Run the programme
as.static.tnet(net)




