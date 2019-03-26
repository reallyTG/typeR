library(SoilR)


### Name: ParallelModel
### Title: ParallelModel
### Aliases: ParallelModel

### ** Examples

      t_start=0 
      t_end=10 
      tn=50
      timestep=(t_end-t_start)/tn 
      t=seq(t_start,t_end,timestep) 
      k=TimeMap.new(t_start,t_end,function(times){c(-0.5,-0.2,-0.3)})
      c0=c(1, 2, 3)
      #constant inputrates
      inputrates=BoundInFlux(
          function(t){matrix(nrow=3,ncol=1,c(1,1,1))},
          t_start,
          t_end
      ) 
      mod=ParallelModel(t,k,c0,inputrates)
      Y=getC(mod)
      lt1=1 ;lt2=2 ;lt3=3 
      col1=1; col2=2; col3=3
      plot(t,Y[,1],type="l",lty=lt1,col=col1,
  ylab="C stocks",xlab="Time") 
      lines(t,Y[,2],type="l",lty=lt2,col=col2) 
      lines(t,Y[,3],type="l",lty=lt3,col=col3) 
      legend(
"topleft",
c("C in pool 1",
  "C in 2",
  "C in pool 3"
),
lty=c(lt1,lt2,lt3),
col=c(col1,col2,col3)
      )
      Y=getAccumulatedRelease(mod)
      plot(t,Y[,1],type="l",lty=lt1,col=col1,ylab="C release",xlab="Time") 
      lines(t,Y[,2],lt2,type="l",lty=lt2,col=col2) 
      lines(t,Y[,3],type="l",lty=lt3,col=col3) 
      legend("topright",c("R1","R2","R3"),lty=c(lt1,lt2,lt3),col=c(col1,col2,col3))
 



