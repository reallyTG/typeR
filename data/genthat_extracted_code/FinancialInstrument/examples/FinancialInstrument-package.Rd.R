library(FinancialInstrument)


### Name: FinancialInstrument-package
### Title: Construct, manage and store contract specifications for trading
### Aliases: FinancialInstrument-package FinancialInstrument
### Keywords: package

### ** Examples

## Not run: 
##D # Construct instruments for several different asset classes
##D # Define a currency and some stocks
##D require("FinancialInstrument")
##D currency(c("USD", "EUR")) # define some currencies
##D stock(c("SPY", "LQD", "IBM", "GS"), currency="USD") # define some stocks
##D exchange_rate("EURUSD") # define an exchange rate
##D 
##D ls_stocks() #get the names of all the stocks
##D ls_instruments() # all instruments
##D 
##D getInstrument("IBM")
##D update_instruments.yahoo(ls_stocks())
##D update_instruments.TTR(ls_stocks()) # doesn't update ETFs
##D update_instruments.masterDATA(ls_stocks()) # only updates ETFs
##D getInstrument("SPY")
##D 
##D ## Compare instruments with all.equal.instrument method
##D all.equal(getInstrument("USD"), getInstrument("USD"))
##D all.equal(getInstrument("USD"), getInstrument("EUR"))
##D all.equal(getInstrument("SPY"), getInstrument("LQD"))
##D 
##D ## Search for the tickers of instruments that contain words
##D find.instrument("computer") #IBM
##D find.instrument("bond")  #LQD
##D 
##D ## Find only the ETFs; update_instruments.masterDATA added a "Fund.Type" field
##D ## to the ETFs, but not to the stocks
##D ls_instruments_by("Fund.Type") # all instruments that have a "Fund.Type" field
##D 
##D # build data.frames with instrument attributes
##D buildHierarchy(ls_stocks(), "Name", "type", "avg.volume")
##D 
##D ## before defining a derivative, must define the root (can define the underlying 
##D ## in the same step)
##D future("ES", "USD", multiplier=50, tick_size=0.25, 
##D     underlying_id=synthetic("SPX", "USD", src=list(src='yahoo', name='^GSPC')))
##D 
##D # above, in addition to defining the future root "ES", we defined an instrument 
##D # named "SPX".  Using the "src" argument causes setSymbolLookup to be called.
##D # Using the "src" arg as above is the same as 
##D # setSymbolLookup(SPX=list(src='yahoo', name='^GSPC'))
##D getSymbols("SPX") # this now works even though the Symbol used by 
##D                   # getSymbols.yahoo is "^GSPC", not "SPX"
##D 
##D ## Back to the futures; we can define a future_series
##D future_series("ES_U2", identifiers=list(other="ESU2"))
##D # identifiers are not necessary, but they allow for the instrument to be found 
##D # by more than one name
##D getInstrument("ESU2") #this will find the instrument even though the primary_id 
##D                       #is "ES_U2"
##D # can also add indentifiers later
##D add.identifier("ES_U2", inhouse="ES_U12")
##D 
##D # can add an arbitrary field with instrument_attr
##D instrument_attr("ES_U2", "description", "S&P 500 e-mini")
##D getInstrument("ES_U2")
##D 
##D option_series.yahoo("GS") # define a bunch of options on "GS"
##D # option root was automatically created
##D getInstrument(".GS")
##D # could also find ".GS" by looking for "GS", but specifiying type
##D getInstrument("GS", type='option')
##D 
##D # if you do not know what type of instrument you need to define, try
##D instrument.auto("ESM3")
##D getInstrument("ESM3")
##D instrument.auto("USDJPY")
##D getInstrument("USDJPY")
##D 
##D instrument.auto("QQQ") #doesn't work as well on ambigous tickers 
##D getInstrument("QQQ")
##D 
##D # Some functions that make it easier to work with futures
##D M2C() # Month To Code
##D M2C()[5]
##D M2C("may")
##D C2M() # Code To Month
##D C2M("J")
##D C2M()[7]
##D MC2N("G") # Month Code to Numeric
##D MC2N("H,K,M")
##D 
##D parse_id("ES_U3")
##D parse_id("EURUSD")
##D 
##D next.future_id("ES_U2")
##D next.future_id("ZC_H2", "H,K,N,U,Z")
##D prev.future_id("CL_H2", 1:12)
##D 
##D sort_ids(ls_instruments()) # sort by expiration date, then alphabetically for 
##D                            # things that don't expire.
##D 
##D format_id("ES_U2", "CYY")
##D format_id("ES_U2", "CYY", sep="")
##D format_id("ES_U2", "MMMYY")
##D 
##D ## Saving the instrument environment to disk
##D tmpdir <- tempdir()
##D saveInstruments("MyInstruments.RData", dir=tmpdir)
##D rm_instruments(keep.currencies=FALSE)
##D ls_instruments() #NULL
##D loadInstruments("MyInstruments.RData", dir=tmpdir)
##D ls_instruments()
##D unlink(tmpdir, recursive=TRUE)
##D 
##D #build a spread:
##D fn_SpreadBuilder(getSymbols(c("IBM", "SPY"), src='yahoo'))
##D head(IBM.SPY)
##D getInstrument("IBM.SPY")
##D 
##D # alternatively, define a spread, then build it
##D spread(members=c("IBM", "GS", "SPY"), memberratio=c(1, -2, 1))
##D buildSpread("IBM.GS.SPY") #Since we hadn't yet downloaded "GS", buildSpread 
##D                           #downloaded it temporarily
##D chartSeries(IBM.GS.SPY)
##D 
##D ## fn_SpreadBuilder will return as many columns as it can 
##D ## (Bid, Ask, Mid, or Op, Cl, Ad), but only works on 2 instrument spreads
##D ## buildSpread works with any number of legs, but returns a single price column
##D 
##D getFX("EUR/USD", from=Sys.Date()-499) # download exchange rate from Oanda
##D 
##D IBM.EUR <- redenominate("IBM", "EUR") #price IBM in EUR instead of dollars
##D chartSeries(IBM, subset='last 500 days', TA=NULL)
##D addTA(Ad(IBM.EUR), on=1, col='red')
##D 
## End(Not run)



