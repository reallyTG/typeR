library(interAdapt)


### Name: compute_design_performance
### Title: Compute Design Performance
### Aliases: compute_design_performance
### Keywords: Adaptive Group clinical designs enrollment, sequential trial,

### ** Examples

#Store function output
o<-compute_design_performance()

names(o)

#Decision rules for trial designs
print(o$SS[[1]])
print(o$SC[[1]])
print(o$AD[[1]])

#Plot decision rules
par(mfrow=c(1,3))
matplot(t(o$SS[[1]][2:3,]),type='o',
		main='Standard trial - subpop 1',
		xlab='stage',ylab='Z-statistic',
		col='blue',pch=2:3,lty=3)
legend('topright',c('H01 Efficacy','H01 Futility')
		,col='blue',pch=2:3,lty=3)
matplot(t(o$SC[[1]][4:5,]),type='o',
		main='Standard trial - combined pop',xlab='stage',
		ylab='Z-statistic',col='red',pch=0:1,lty=3)
legend('topright',c('H0C Efficacy','H0C Futility'),
		col='red',pch=0:1,lty=3)
matplot(t(o$AD[[1]][4:7,]),type='o',
		main='Adaptive Enrollment',xlab='stage',
		ylab='Z-statistic',col=c('red','red','blue','blue'),
		pch=0:3,lty=3)
legend('topright',c('H0C Efficacy','H0C Futility',
		'H01 Efficacy','H01 Futility'),col=c('red',
		'red','blue','blue'),pch=0:3,lty=3)

#Check performance
o$performance[[1]]


#Plot performance over a range of treatment effects for subpop2
col1<-c('black','black','black','green','blue')


perform_names<-rownames(o$performance[[1]])

#index for parts of the table corresponding to power
p_ind<- grep('Power',perform_names)
#index for parts of the table corresponding to sample size
s_ind<- grep('Sample Size',perform_names)
#index for parts of the table corresponding to trial duration
d_ind<- grep('DUR',perform_names)


par(mfrow=c(1,3))

lty1<-c(2,3,1,4,5)
matplot(x=t(o$performance[[1]][1,]),t(o$performance[[1]][p_ind,]),
		type='l',lty=lty1,col=col1[1:5],xlab='Subpop.2 Tx. Effect',
		ylab='Power',main='Power')
legend('bottomleft',perform_names[p_ind],col=col1[1:length(p_ind)],
		lty=lty1)


matplot(x=t(o$performance[[1]][1,]),t(o$performance[[1]][s_ind,]),
		type='l',lty=1:3,col=col1[3:5],xlab='Subpop.2 Tx. Effect',
		ylab='Expected Sample Size',main='Expected Sample Size')
legend('topright',substr(perform_names[d_ind],1,2),col=col1[3:5],
		lty=1:3)


matplot(x=t(o$performance[[1]][1,]),t(o$performance[[1]][d_ind,]),
		type='l',lty=1:3,col=col1[3:5],xlab='Subpop.2 Tx. Effect',
		ylab="Expected Duration",main='Expected Duration')
legend('topright',substr(perform_names[d_ind],1,2),col=col1[3:5],
		lty=1:3)



