library(apc)


### Name: apc.data.list
### Title: Arrange data as an apc.data.list
### Aliases: apc.data.list

### ** Examples

###############
#	Artificial data
#	(1) Generate a 5x7 matrix and make arbitrary decisions for rest

response <- matrix(data=seq(1:35),nrow=5,ncol=7)
data.list	<- apc.data.list(response=response,data.format="AP",
					age1=25,per1=1955,coh1=NULL,unit=5,
					per.zero=NULL,per.max=NULL)
data.list

#	(2) Chain Ladder data

k			<- 5
v.response 	<- seq(1:(k*(k+1)/2))
data.list	<- apc.data.list(response=vector.2.triangle(v.response,k),
							data.format="CL.vector.by.row",age1=2001)
data.list

###############
#	Japanese breast cancer
#	This is the code used to generate the data.Japanese.breast.cancer
v.rates		<- c( 0.44, 0.38, 0.46, 0.55, 0.68,
			 	  1.69, 1.69, 1.75, 2.31, 2.52,
				  4.01, 3.90, 4.11, 4.44, 4.80,
				  6.59, 6.57, 6.81, 7.79, 8.27,
				  8.51, 9.61, 9.96,11.68,12.51,
				 10.49,10.80,12.36,14.59,16.56,
				 11.36,11.51,12.98,14.97,17.79,
				 12.03,10.67,12.67,14.46,16.42,
				 12.55,12.03,12.10,13.81,16.46,
				 15.81,13.87,12.65,14.00,15.60,
				 17.97,15.62,15.83,15.71,16.52)
v.cases		<- c(   88,   78,  101,  127,  179,
				   299,  330,  363,  509,  588,
				   596,  680,  798,  923, 1056,
				   874,  962, 1171, 1497, 1716,
				  1022, 1247, 1429, 1987, 2398,
				  1035, 1258, 1560, 2079, 2794,
				   970, 1087, 1446, 1828, 2465,
				   820,  861, 1126, 1549, 1962,
				   678,  738,  878, 1140, 1683,
				   640,  628,  656,  900, 1162,
				   497,  463,  536,  644,  865)				 
#	see also example below for generating labels

rates	<- matrix(data=v.rates,nrow=11, ncol=5,byrow=TRUE)
cases	<- matrix(data=v.cases,nrow=11, ncol=5,byrow=TRUE)

# 	A data list is now constructed as follows
#	note that list entry rates is redundant,
#	but included since it represents original data

data.Japanese.breast.cancer	<- apc.data.list(response=cases,
			dose=cases/rates,data.format="AP",
			age1=25,per1=1955,coh1=NULL,unit=5,
			per.zero=NULL,per.max=NULL,time.adjust=0,
			label="Japanese breast cancer")

#	or when exploiting the default values

data.Japanese.breast.cancer	<- apc.data.list(response=cases,
			dose=cases/rates,data.format="AP",
			age1=25,per1=1955,unit=5,
			label="Japanese breast cancer")

###################################################
# 	Code for generating labels

row.names <- paste(as.character(seq(25,75,by=5)),"-",as.character(seq(29,79,by=5)),sep="")
col.names <- paste(as.character(seq(1955,1975,by=5)),"-",as.character(seq(1959,1979,by=5)),sep="")




