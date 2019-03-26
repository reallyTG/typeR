## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
knitr::opts_chunk$set(tidy = FALSE)
figwidth.out <- 600
dpi.HQ <- 150

## ----params, dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
    library(MetaboLouise)

    set.seed(7)
    ### General
    Nmetabos <- 20L
    Nrates <- 10L
    
    Network <- NetworkCreateR(N = Nmetabos)

## ----network image, dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
    image(Network, 
          col = terrain.colors(2), 
          useRaster = T, 
          axes = FALSE,
          xlab="flow to",
          ylab="flow from")
    axis(1, at = c(0,1), labels=c(1, ncol(Network)),srt=45,tick=FALSE)
    axis(2, at = c(0,1), labels=c(1, ncol(Network)),srt=45,tick=FALSE)


## ----rates---------------------------------------------------------------
    rate_vector <- round(5*runif(Nrates))

    rate_mapping <- Network
    active_rates <- which(Network == 1, arr.ind = T)
        for(rr in 1:nrow(active_rates)){
            rate_mapping[active_rates[rr,1], active_rates[rr,2]] <- sample(seq_along(rate_vector), size = 1)
        }
    

## ----simulation, dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
    
    SimulatedData <- DataSimulateR(NetworkMatrix = Network, dT = 0.01, Tstart = 0, Tstop = 5, 
                                   T0_nodes = 100, rate_vector = rate_vector, 
                                   rate_mapping = rate_mapping, plot_out = TRUE)
 

## ----rates2, results = "hide", dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
    
Rate_function <- RateFunctionBuildR(type = "sigmoid", C_range = c(0,200), sig_C0 = 100)
RateFunctionBuildR(type = c("sigmoid", "step"), C_range = c(0,200), 
                   sig_C0 = 50, sig_k = 0.2,
                   step_levels = c(0,1,2), step_switchpoints = c(10, 140))


## ----influxVSno_influx, dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
    
    No_influx <- DataSimulateR(NetworkMatrix = Network, dT = 0.01, Tstart = 0, Tstop = 5, 
                               T0_nodes = 100, influx_vector = NULL, influx_Tframe = NULL,
                               rate_vector = rate_vector, rate_mapping = rate_mapping, 
                               RateFunctionObject = Rate_function, plot_out = TRUE)
    
    
    influx_vector = c(rep(1,10),rep(0,Nmetabos-10))
    With_influx <- DataSimulateR(NetworkMatrix = Network, dT = 0.01, Tstart = 0, Tstop = 5, 
                                 T0_nodes = 100, influx_vector = influx_vector, influx_Tframe = 0.5,
                                 rate_vector = rate_vector, rate_mapping = rate_mapping, 
                                 RateFunctionObject = Rate_function, plot_out = TRUE)
    

## ----FC_plot, results = "hide", dpi=dpi.HQ, fig.width=7, fig.height=5, out.width = figwidth.out----
      
    GetFoldChanges(ReferenceDataObject = No_influx, AlternativeDataObject = With_influx, plot_title = "Influx vs no influx")


