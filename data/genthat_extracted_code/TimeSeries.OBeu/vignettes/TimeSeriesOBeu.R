## ----load, warning=FALSE, include=TRUE-----------------------------------
# load TimeSeries.OBeu
library(TimeSeries.OBeu)

## ----data----------------------------------------------------------------
#example openbudgets.eu time series data
sample.ts.data = 
'{"page":0,
"page_size": 30,
"total_cell_count": 15,
"cell": [],
"status": "ok",
"cells": [{
		"global__fiscalPeriod__28951.notation": "2002",
		"global__amount__0397f.sum": 290501420.64,
		"global__amount__0397f__CZK.sum": 9210928544.2325,
		"_count": 4805
	},
	{
		"global__fiscalPeriod__28951.notation": "2003",
		"global__amount__0397f.sum": 311242291.07,
		"global__amount__0397f__CZK.sum": 9832143974.9013,
		"_count": 4988
	},
	{
		"global__fiscalPeriod__28951.notation": "2004",
		"global__amount__0397f.sum": 5268500701.1,
		"global__amount__0397f__CZK.sum": 170688885714.24,
		"_count": 10055
	},
	{
		"global__fiscalPeriod__28951.notation": "2005",
		"global__amount__0397f.sum": 2542887761.01,
		"global__amount__0397f__CZK.sum": 77204615312.025,
		"_count": 2032
	},
	{
		"global__fiscalPeriod__28951.notation": "2006",
		"global__amount__0397f.sum": 14803951786.68,
		"global__amount__0397f__CZK.sum": 429758720367.32,
		"_count": 13632
	},
	{
		"global__fiscalPeriod__28951.notation": "2007",
		"global__amount__0397f.sum": 16188514346.44,
		"global__amount__0397f__CZK.sum": 445588857385.76,
		"_count": 22798
	},
	{
		"global__fiscalPeriod__28951.notation": "2008",
		"global__amount__0397f.sum": 18231035815.89,
		"global__amount__0397f__CZK.sum": 480643028250.12,
		"_count": 24176
	},
	{
		"global__fiscalPeriod__28951.notation": "2009",
		"global__amount__0397f.sum": 19079541164.68,
		"global__amount__0397f__CZK.sum": 511808691742.54,
		"_count": 26250
	},
	{
		"global__fiscalPeriod__28951.notation": "2010",
		"global__amount__0397f.sum": 22738650575.01,
		"global__amount__0397f__CZK.sum": 597685430364.14,
		"_count": 87667
	},
	{
		"global__fiscalPeriod__28951.notation": "2011",
		"global__amount__0397f.sum": 24961375670.57,
		"global__amount__0397f__CZK.sum": 626230992823.26,
		"_count": 134352
	},
	{
		"global__fiscalPeriod__28951.notation": "2012",
		"global__amount__0397f.sum": 261513607691.41,
		"global__amount__0397f__CZK.sum": 7030666436872.5,
		"_count": 147556
	},
	{
		"global__fiscalPeriod__28951.notation": "2013",
		"global__amount__0397f.sum": 268946402299.09,
		"global__amount__0397f__CZK.sum": 7226220232913.8,
		"_count": 150079
	},
	{
		"global__fiscalPeriod__28951.notation": "2014",
		"global__amount__0397f.sum": 255222816704.9,
		"global__amount__0397f__CZK.sum": 6907598086283.4,
		"_count": 176019
	},
	{
		"global__fiscalPeriod__28951.notation": "2015",
		"global__amount__0397f.sum": 22976062973.62,
		"global__amount__0397f__CZK.sum": 636276111928.46,
		"_count": 213777
	},
	{
		"global__fiscalPeriod__28951.notation": "2016",
		"global__amount__0397f.sum": 12051686541.16,
		"global__amount__0397f__CZK.sum": 325672725401.77,
		"_count": 161797
	}
],
"order": [
	["global__fiscalPeriod__28951.fiscalPeriod", "asc"]
],
"aggregates": ["", "_count"],
"summary": {
	"global__amount__0397f.sum": 945126777743.27,
	"global__amount__0397f__CZK.sum": 25485085887878
},
"attributes": [""]
}'

## ----open_spending-------------------------------------------------------
result = open_spending.ts(
  json_data =  sample.ts.data, 
  time ="global__fiscalPeriod__28951.notation",
  amount = "global__amount__0397f.sum"
  )
# Pretty output using prettify of jsonlite library
jsonlite::prettify(result,indent = 2)

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  ../library/TimeSeries.OBeu/R/open_spending.ts
#  # library/ {name of the library} /R/ {function}

