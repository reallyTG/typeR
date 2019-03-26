setup_aleatory_analysis_tests <- function()
{
  dir.create(file.path(getwd(),"AA"))
  dir.create(file.path(getwd(),"AA","1"))
  dir.create(file.path(getwd(),"AA","1","1"))
  dir.create(file.path(getwd(),"AA","1","2"))
  dir.create(file.path(getwd(),"AA","1","1","1"))
  result <- rbind(cbind("LTin",60,5,7.122952256821662,251.10682876417619,144.14462790522074,268.914235573142,156.89133519919767,408.00000000000045,6.800000000000008,87.59746883085843,1.4599578138476406,0.21469967850700572,253.87251072765034),
                  cbind("LTin",60,5,6.368260902818188,411.95783607163355,141.21632352388357,420.29709165126906,142.34321171781562,360.00000000000006,6.000000000000001,33.66019860288536,0.5610033100480893,0.09350055167468153,263.8285830640416))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","1","1","trackedCells_Close.csv"))

  dir.create(file.path(getwd(),"AA","1","2","1"))
  result <- rbind(cbind("LTin",60,5,6.723554765299691,374.71375561114155,95.8334950137342,378.9179999472754,109.22946790783558,383.9999999999997,6.399999999999995,56.16087751699224,0.9360146252832039,0.14625228520050074,132.85527311528736),
                  cbind("LTi",60,8,4.3569526500765114,359.29042128895605,133.17741617310222,345.6128992154998,131.5787776206137,231.5569526500765,3.8592825441679417,55.08252068181133,0.9180420113635221,0.2378789323810577,30.215703672286484))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","2","1","trackedCells_Close.csv"))

  dir.create(file.path(getwd(),"AA","2"))
  dir.create(file.path(getwd(),"AA","2","1"))
  dir.create(file.path(getwd(),"AA","2","2"))
  dir.create(file.path(getwd(),"AA","2","1","1"))
  result<-rbind(cbind("LTin",60,5,6.653830555054499,290.76235282195177,150.90402728473288,280.8129073656347,140.81506307121816,383.9999999999997,6.399999999999995,56.67855520950528,0.944642586825088,0.1476004041914201,220.6175396955185),
                cbind("LTi",60,8,4.7777362501042795,351.5941551796297,131.61693069075838,335.5563543037901,130.92396830628687,126.64340625260706,2.110723437543451,64.21105871101939,1.0701843118503231,0.5070225178793906,4.54146562270518))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","1","trackedCells_Close.csv"))
  dir.create(file.path(getwd(),"AA","2","1","2"))
  result<-rbind(cbind("LTi",60,8,6.16403771354117,348.38217374298074,115.98357302895775,353.69944751242696,117.83907548131987,153.372867411447,2.55621445685745,22.526886936268,0.37544811560446667,0.14687661068392271,2.8101004362545168),
                cbind("LTi",60,8,6.248662981013516,346.46336139060736,144.0520620960155,356.70658394468234,134.93094705799285,154.22727067722974,2.570454511287162,54.86249689238042,0.9143749482063404,0.3557250066831428,15.484557918851964))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","2","trackedCells_Close.csv"))

  dir.create(file.path(getwd(),"AA","2","2","1"))
  result<-rbind(cbind("LTi",60,8,8.288938384426423,335.37075539134696,102.297609760607,327.3129875167963,124.56237224360576,229.489829304102,3.8248304884017,94.71196516128173,1.5785327526880288,0.4127065911743602,6.659420647643687),
                cbind("LTi",60,8,6.6187380175340085,326.72989946646044,128.02468607246536,332.195299878203,124.32760866816147,163.83097440328228,2.7305162400547047,26.393630441935077,0.43989384069891796,0.1611028106136094,10.908754190177065))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","1","trackedCells_Close.csv"))
  dir.create(file.path(getwd(),"AA","2","2","2"))
  result<-rbind(cbind("LTi",60,8,5.608417338030677,350.50331778401727,125.13240150292185,354.5222818441987,123.99392571079619,114.14309474652151,1.9023849124420251,16.708416679643133,0.2784736113273855,0.14638131826325235,6.091394559709608),
                cbind("LTi",60,8,4.8471831781689385,340.43770124007773,137.09944667528288,341.60260093828515,143.87611877325938,118.2380299197166,1.9706338319952765,27.504261787694496,0.4584043631282416,0.23261772719293308,7.613185922897727))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","2","trackedCells_Close.csv"))
}

setup_aleatory_analysis_overTime <- function()
{
  dir.create(file.path(getwd(),"AA"))
  dir.create(file.path(getwd(),"AA","1"))
  dir.create(file.path(getwd(),"AA","1","1"))
  dir.create(file.path(getwd(),"AA","1","2"))
  dir.create(file.path(getwd(),"AA","1","1","1"))
  result <- rbind(cbind("LTin",60,5,7.122952256821662,251.10682876417619,144.14462790522074,268.914235573142,156.89133519919767,408.00000000000045,6.800000000000008,87.59746883085843,1.4599578138476406,0.21469967850700572,253.87251072765034),
                  cbind("LTin",60,5,6.368260902818188,411.95783607163355,141.21632352388357,420.29709165126906,142.34321171781562,360.00000000000006,6.000000000000001,33.66019860288536,0.5610033100480893,0.09350055167468153,263.8285830640416))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","1","1","trackedCells_Close_12.csv"))
  result<-rbind(cbind("LTi",60,8,6.248662981013516,346.46336139060736,144.0520620960155,356.70658394468234,134.93094705799285,154.22727067722974,2.570454511287162,54.86249689238042,0.9143749482063404,0.3557250066831428,15.484557918851964),
                cbind("LTi",60,8,6.842109389931448,334.02273857334524,134.28542667084238,332.79799308708823,131.40849786880278,124.71585962883465,2.0785976604805776,12.507099320377637,0.20845165533962728,0.10028475414113219,10.109650517843063))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","1","1","trackedCells_Close_36.csv"))

  dir.create(file.path(getwd(),"AA","1","2","1"))
  result <- rbind(cbind("LTin",60,5,6.723554765299691,374.71375561114155,95.8334950137342,378.9179999472754,109.22946790783558,383.9999999999997,6.399999999999995,56.16087751699224,0.9360146252832039,0.14625228520050074,132.85527311528736),
                  cbind("LTi",60,8,4.3569526500765114,359.29042128895605,133.17741617310222,345.6128992154998,131.5787776206137,231.5569526500765,3.8592825441679417,55.08252068181133,0.9180420113635221,0.2378789323810577,30.215703672286484))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","2","1","trackedCells_Close_12.csv"))
  result <- rbind(cbind("LTi",60,8,4.127933218766038,341.9280477260914,146.34490478525368,335.7488488621181,149.12107838711057,122.0145308128528,2.0335755135475466,27.096756549277497,0.451612609154625,0.22207811126068905,5.189724022131393),
                  cbind("LTi",60,8,6.284065833254673,341.5406384858206,122.68502927444825,356.8010685409833,128.77664472976508,112.54505333207477,1.8757508888679129,65.72530767659816,1.0954217946099694,0.5839910838432806,15.972336169998137))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","1","2","1","trackedCells_Close_36.csv"))

  dir.create(file.path(getwd(),"AA","2"))
  dir.create(file.path(getwd(),"AA","2","1"))
  dir.create(file.path(getwd(),"AA","2","2"))
  dir.create(file.path(getwd(),"AA","2","1","1"))
  result<-rbind(cbind("LTin",60,5,6.653830555054499,290.76235282195177,150.90402728473288,280.8129073656347,140.81506307121816,383.9999999999997,6.399999999999995,56.67855520950528,0.944642586825088,0.1476004041914201,220.6175396955185),
                cbind("LTi",60,8,4.7777362501042795,351.5941551796297,131.61693069075838,335.5563543037901,130.92396830628687,126.64340625260706,2.110723437543451,64.21105871101939,1.0701843118503231,0.5070225178793906,4.54146562270518))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","1","trackedCells_Close_12.csv"))
  result <- rbind(cbind("LTi",60,8,3.959837181242495,342.3040689595315,143.24537526115162,350.41651381140605,134.00475340259075,96.31641798733486,1.6052736331222477,49.18550254822963,0.8197583758038272,0.5106658197639501,13.174339257992433),
                  cbind("LTi",60,8,4.643030972764401,355.84920319832156,123.77388289361872,342.13024828557786,115.63653309294176,115.18971237358127,1.919828539559688,63.802969921654494,1.0633828320275749,0.5538946890910693,10.262924096099098))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","1","trackedCells_Close_36.csv"))

  dir.create(file.path(getwd(),"AA","2","1","2"))
  result<-rbind(cbind("LTi",60,8,6.16403771354117,348.38217374298074,115.98357302895775,353.69944751242696,117.83907548131987,153.372867411447,2.55621445685745,22.526886936268,0.37544811560446667,0.14687661068392271,2.8101004362545168),
                cbind("LTi",60,8,6.248662981013516,346.46336139060736,144.0520620960155,356.70658394468234,134.93094705799285,154.22727067722974,2.570454511287162,54.86249689238042,0.9143749482063404,0.3557250066831428,15.484557918851964))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","2","trackedCells_Close_12.csv"))
  result<-rbind(cbind("LTi",60,8,4.794229487722124,341.92202776671564,132.54627459516257,355.6802453634861,126.63858099612742,101.88458975444244,1.698076495907374,59.89182182571045,0.9981970304285075,0.5878398486960488,15.178609097548986),
                cbind("LTi",60,8,4.127933218766038,341.9280477260914,146.34490478525368,335.7488488621181,149.12107838711057,122.0145308128528,2.0335755135475466,27.096756549277497,0.451612609154625,0.22207811126068905,5.189724022131393))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","1","2","trackedCells_Close_36.csv"))

  dir.create(file.path(getwd(),"AA","2","2","1"))
  result<-rbind(cbind("LTi",60,8,8.288938384426423,335.37075539134696,102.297609760607,327.3129875167963,124.56237224360576,229.489829304102,3.8248304884017,94.71196516128173,1.5785327526880288,0.4127065911743602,6.659420647643687),
                cbind("LTi",60,8,6.6187380175340085,326.72989946646044,128.02468607246536,332.195299878203,124.32760866816147,163.83097440328228,2.7305162400547047,26.393630441935077,0.43989384069891796,0.1611028106136094,10.908754190177065))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","1","trackedCells_Close_12.csv"))
  result<-rbind(cbind("LTi",60,8,8.288938384426423,335.37075539134696,102.297609760607,327.3129875167963,124.56237224360576,229.489829304102,3.8248304884017,94.71196516128173,1.5785327526880288,0.4127065911743602,6.659420647643687),
                cbind("LTi",60,8,6.6187380175340085,326.72989946646044,128.02468607246536,332.195299878203,124.32760866816147,163.83097440328228,2.7305162400547047,26.393630441935077,0.43989384069891796,0.1611028106136094,10.908754190177065))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","1","trackedCells_Close_36.csv"))

  dir.create(file.path(getwd(),"AA","2","2","2"))
  result<-rbind(cbind("LTi",60,8,5.608417338030677,350.50331778401727,125.13240150292185,354.5222818441987,123.99392571079619,114.14309474652151,1.9023849124420251,16.708416679643133,0.2784736113273855,0.14638131826325235,6.091394559709608),
                cbind("LTi",60,8,4.8471831781689385,340.43770124007773,137.09944667528288,341.60260093828515,143.87611877325938,118.2380299197166,1.9706338319952765,27.504261787694496,0.4584043631282416,0.23261772719293308,7.613185922897727))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","2","trackedCells_Close_12.csv"))
  result<-rbind(cbind("LTi",60,8,4.5771408360373185,336.70774619327017,149.7003946161774,331.6290793139636,142.70700938556317,151.8056617369703,2.5300943622828385,34.57173278960458,0.5761955464934096,0.2277367813165369,13.297001203529392),
                cbind("LTi",60,8,4.387447503144171,340.1425899930118,128.81148284294164,340.2552337817464,127.97792316544125,91.3615025597393,1.5226917093289882,3.364545399533289,0.05607575665888815,0.03682673013541219,8.528072525346083))
  colnames(result)<-c("Cell Type","Time Span","Cell State","Cell Speed","Cell Start Position X","Cell Start Position Y","Cell End Position X","Cell End Position Y","Length","Velocity","Displacement","Displacement Rate","Meandering Index","Nearest LTo Cell (microns)")
  write_data_to_csv(result, file.path(getwd(),"AA","2","2","2","trackedCells_Close_36.csv"))
}
