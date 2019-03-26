library("planor")
robotFacB <- planor.factors(factors=list(
                        nsoil=c("curd","Saint-Paulin"),
                        qsoil=c("10mg","100mg"),
                        rough=c(0.25,0.73),
                        conc=c("1%","3%"),
                        Tact=c("15mn","30mn"),
                        plate=5:6,
                        col=1:4,
                        u=1:2),
                     block=~plate+col,
                     hierarchy=list(~nsoil/(plate*col),
                                    ~qsoil/(plate*col),
                                    ~conc/plate,
                                    ~Tact/plate))
robotModB <- planor.model( model=~nsoil * qsoil * rough * conc,
                    listofmodels=list(c(~plate*col+rough,~rough),
                                      c(~Tact,~Tact)) )
robotKeyB <- planor.designkey(factors=robotFacB, model=robotModB, 
                    nunits=16, base=~plate+col+u )
print(robotKeyB)

