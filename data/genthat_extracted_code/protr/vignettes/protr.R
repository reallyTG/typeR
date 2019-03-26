## ------------------------------------------------------------------------
library("protr")

# load FASTA files
extracell = readFASTA(system.file(
  "protseq/extracell.fasta", package = "protr"))
mitonchon = readFASTA(system.file(
  "protseq/mitochondrion.fasta", package = "protr"))

## ---- eval = FALSE-------------------------------------------------------
#  length(extracell)

## ---- eval = FALSE-------------------------------------------------------
#  ## [1] 325

## ---- eval = FALSE-------------------------------------------------------
#  length(mitonchon)

## ---- eval = FALSE-------------------------------------------------------
#  ## [1] 306

## ---- eval = FALSE-------------------------------------------------------
#  extracell = extracell[(sapply(extracell, protcheck))]
#  mitonchon = mitonchon[(sapply(mitonchon, protcheck))]

## ---- eval = FALSE-------------------------------------------------------
#  length(extracell)

## ---- eval = FALSE-------------------------------------------------------
#  ## [1] 323

## ---- eval = FALSE-------------------------------------------------------
#  length(mitonchon)

## ---- eval = FALSE-------------------------------------------------------
#  ## [1] 304

## ---- eval = FALSE-------------------------------------------------------
#  # calculate APseAAC descriptors
#  x1 = t(sapply(extracell, extractAPAAC))
#  x2 = t(sapply(mitonchon, extractAPAAC))
#  x  = rbind(x1, x2)
#  
#  # make class labels
#  labels = as.factor(c(rep(0, length(extracell)), rep(1, length(mitonchon))))

## ---- eval = FALSE-------------------------------------------------------
#  set.seed(1001)
#  
#  # split training and test set
#  tr.idx = c(
#    sample(1:nrow(x1), round(nrow(x1) * 0.75)),
#    sample(nrow(x1) + 1:nrow(x2), round(nrow(x2) * 0.75))
#  )
#  te.idx = setdiff(1:nrow(x), tr.idx)
#  
#  x.tr = x[tr.idx, ]
#  x.te = x[te.idx, ]
#  y.tr = labels[tr.idx]
#  y.te = labels[te.idx]

## ---- eval = FALSE-------------------------------------------------------
#  library("randomForest")
#  rf.fit = randomForest(x.tr, y.tr, cv.fold = 5)
#  print(rf.fit)

## ---- eval = FALSE-------------------------------------------------------
#  ## Call:
#  ##  randomForest(x = x.tr, y = y.tr, cv.fold = 5)
#  ##                Type of random forest: classification
#  ##                      Number of trees: 500
#  ## No. of variables tried at each split: 8
#  ##
#  ##         OOB estimate of  error rate: 25.11%
#  ## Confusion matrix:
#  ##     0   1 class.error
#  ## 0 196  46   0.1900826
#  ## 1  72 156   0.3157895

## ---- eval = FALSE-------------------------------------------------------
#  # predict on test set
#  rf.pred = predict(rf.fit, newdata = x.te, type = "prob")[, 1]
#  
#  # plot ROC curve
#  library("pROC")
#  plot.roc(y.te, rf.pred, grid = TRUE, print.auc = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  ## Call:
#  ## plot.roc.default(x = y.te, predictor = rf.pred, col = "#0080ff",
#  ##                  grid = TRUE, print.auc = TRUE)
#  ##
#  ## Data: rf.pred in 81 controls (y.te 0) > 76 cases (y.te 1).
#  ## Area under the curve: 0.8697

## ---- extractAAC---------------------------------------------------------
library("protr")

x = readFASTA(system.file(
  "protseq/P00750.fasta", package = "protr"))[[1]]

extractAAC(x)

## ---- extractDC----------------------------------------------------------
dc = extractDC(x)
head(dc, n = 30L)

## ---- extractTC----------------------------------------------------------
tc = extractTC(x)
head(tc, n = 36L)

## ---- extractMoreau1-----------------------------------------------------
moreau = extractMoreauBroto(x)
head(moreau, n = 36L)

## ---- extractMoreau2-----------------------------------------------------
# Define 3 custom properties
myprops = data.frame(
  AccNo = c("MyProp1", "MyProp2", "MyProp3"),
  A = c(0.62,  -0.5, 15),  R = c(-2.53,   3, 101),
  N = c(-0.78,  0.2, 58),  D = c(-0.9,    3, 59),
  C = c(0.29,    -1, 47),  E = c(-0.74,   3, 73),
  Q = c(-0.85,  0.2, 72),  G = c(0.48,    0, 1),
  H = c(-0.4,  -0.5, 82),  I = c(1.38, -1.8, 57),
  L = c(1.06,  -1.8, 57),  K = c(-1.5,    3, 73),
  M = c(0.64,  -1.3, 75),  F = c(1.19, -2.5, 91),
  P = c(0.12,     0, 42),  S = c(-0.18, 0.3, 31),
  T = c(-0.05, -0.4, 45),  W = c(0.81, -3.4, 130),
  Y = c(0.26,  -2.3, 107), V = c(1.08, -1.5, 43)
)

# Use 4 properties in the AAindex database, and 3 cutomized properties
moreau2 = extractMoreauBroto(
  x, customprops = myprops,
  props = c(
    "CIDH920105", "BHAR880101",
    "CHAM820101", "CHAM820102",
    "MyProp1", "MyProp2", "MyProp3"))

head(moreau2, n = 36L)

## ---- extractMoran-------------------------------------------------------
# Use the 3 custom properties defined before
# and 4 properties in the AAindex database
moran = extractMoran(
  x, customprops = myprops,
  props = c(
    "CIDH920105", "BHAR880101",
    "CHAM820101", "CHAM820102",
    "MyProp1", "MyProp2", "MyProp3"))

head(moran, n = 36L)

## ---- extractGeary-------------------------------------------------------
# Use the 3 custom properties defined before
# and 4 properties in the AAindex database
geary = extractGeary(
  x, customprops = myprops,
  props = c(
    "CIDH920105", "BHAR880101",
    "CHAM820101", "CHAM820102",
    "MyProp1", "MyProp2", "MyProp3"))

head(geary, n = 36L)

## ---- extractCTDC--------------------------------------------------------
extractCTDC(x)

## ---- extractCTDT--------------------------------------------------------
extractCTDT(x)

## ---- extractCTDD--------------------------------------------------------
extractCTDD(x)

## ---- extractCTriad------------------------------------------------------
ctriad = extractCTriad(x)
head(ctriad, n = 65L)

## ---- extractSOCN--------------------------------------------------------
extractSOCN(x)

## ---- extractQSO---------------------------------------------------------
extractQSO(x)

## ---- extractPAAC--------------------------------------------------------
extractPAAC(x)

## ---- extractAPAAC-------------------------------------------------------
extractAPAAC(x)

## ---- extractDescScales--------------------------------------------------
x = readFASTA(system.file(
  "protseq/P00750.fasta", package = "protr"))[[1]]

descscales = extractDescScales(
  x, propmat = "AATopo",
  index = c(37:41, 43:47),
  pc = 5, lag = 7, silent = FALSE)

## ---- extractDescScales2-------------------------------------------------
length(descscales)
head(descscales, 15)

## ---- extractBLOSUM------------------------------------------------------
x = readFASTA(system.file(
  "protseq/P00750.fasta", package = "protr"))[[1]]

blosum = extractBLOSUM(
  x, submat = "AABLOSUM62",
  k = 5, lag = 7, scale = TRUE, silent = FALSE)

## ---- extractBLOSUM2-----------------------------------------------------
length(blosum)
head(blosum, 15)

## ---- eval = FALSE-------------------------------------------------------
#  s1 = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
#  s2 = readFASTA(system.file("protseq/P08218.fasta", package = "protr"))[[1]]
#  s3 = readFASTA(system.file("protseq/P10323.fasta", package = "protr"))[[1]]
#  s4 = readFASTA(system.file("protseq/P20160.fasta", package = "protr"))[[1]]
#  s5 = readFASTA(system.file("protseq/Q9NZP8.fasta", package = "protr"))[[1]]
#  plist = list(s1, s2, s3, s4, s5)
#  psimmat = parSeqSim(plist, cores = 4, type = "local", submat = "BLOSUM62")
#  print(psimmat)

## ---- eval = FALSE-------------------------------------------------------
#  ##            [,1]       [,2]       [,3]       [,4]       [,5]
#  ## [1,] 1.00000000 0.11825938 0.10236985 0.04921696 0.03943488
#  ## [2,] 0.11825938 1.00000000 0.18858241 0.12124217 0.06391103
#  ## [3,] 0.10236985 0.18858241 1.00000000 0.05819984 0.06175942
#  ## [4,] 0.04921696 0.12124217 0.05819984 1.00000000 0.05714638
#  ## [5,] 0.03943488 0.06391103 0.06175942 0.05714638 1.00000000

## ---- eval = FALSE-------------------------------------------------------
#  # by GO Terms
#  go1 = c("GO:0005215", "GO:0005488", "GO:0005515",
#          "GO:0005625", "GO:0005802", "GO:0005905")  # AP4B1
#  go2 = c("GO:0005515", "GO:0005634", "GO:0005681",
#          "GO:0008380", "GO:0031202")                # BCAS2
#  go3 = c("GO:0003735", "GO:0005622", "GO:0005840",
#          "GO:0006412")                              # PDE4DIP
#  glist = list(go1, go2, go3)
#  gsimmat1 = parGOSim(glist, type = "go", ont = "CC")
#  print(gsimmat1)

## ---- eval = FALSE-------------------------------------------------------
#  ##       [,1]  [,2]  [,3]
#  ## [1,] 1.000 0.077 0.055
#  ## [2,] 0.077 1.000 0.220
#  ## [3,] 0.055 0.220 1.000

## ---- eval = FALSE-------------------------------------------------------
#  # by Entrez gene id
#  genelist = list(c("150", "151", "152", "1814", "1815", "1816"))
#  gsimmat2 = parGOSim(genelist, type = "gene")
#  print(gsimmat2)

## ---- eval = FALSE-------------------------------------------------------
#  ##        150   151   152  1814  1815  1816
#  ## 150  0.689 0.335 0.487 0.133 0.169 0.160
#  ## 151  0.335 0.605 0.441 0.171 0.198 0.274
#  ## 152  0.487 0.441 0.591 0.151 0.178 0.198
#  ## 1814 0.133 0.171 0.151 0.512 0.401 0.411
#  ## 1815 0.169 0.198 0.178 0.401 0.619 0.481
#  ## 1816 0.160 0.274 0.198 0.411 0.481 0.819

## ---- eval = FALSE-------------------------------------------------------
#  ids = c("P00750", "P00751", "P00752")
#  prots = getUniProt(ids)
#  print(prots)

## ---- eval = FALSE-------------------------------------------------------
#  ## [[1]]
#  ## [1] "MDAMKRGLCCVLLLCGAVFVSPSQEIHARFRRGARSYQVICRDEKTQMIYQQHQSWLRPVLRSNRVEYCWCN
#  ## SGRAQCHSVPVKSCSEPRCFNGGTCQQALYFSDFVCQCPEGFAGKCCEIDTRATCYEDQGISYRGTWSTAESGAECT
#  ## NWNSSALAQKPYSGRRPDAIRLGLGNHNYCRNPDRDSKPWCYVFKAGKYSSEFCSTPACSEGNSDCYFGNGSAYRGT
#  ## HSLTESGASCLPWNSMILIGKVYTAQNPSAQALGLGKHNYCRNPDGDAKPWCHVLKNRRLTWEYCDVPSCSTCGLRQ
#  ## YSQPQFRIKGGLFADIASHPWQAAIFAKHRRSPGERFLCGGILISSCWILSAAHCFQERFPPHHLTVILGRTYRVVP
#  ## GEEEQKFEVEKYIVHKEFDDDTYDNDIALLQLKSDSSRCAQESSVVRTVCLPPADLQLPDWTECELSGYGKHEALSP
#  ## FYSERLKEAHVRLYPSSRCTSQHLLNRTVTDNMLCAGDTRSGGPQANLHDACQGDSGGPLVCLNDGRMTLVGIISWG
#  ## LGCGQKDVPGVYTKVTNYLDWIRDNMRP"
#  ##
#  ## [[2]]
#  ## [1] "MGSNLSPQLCLMPFILGLLSGGVTTTPWSLARPQGSCSLEGVEIKGGSFRLLQEGQALEYVCPSGFYPYPVQ
#  ## TRTCRSTGSWSTLKTQDQKTVRKAECRAIHCPRPHDFENGEYWPRSPYYNVSDEISFHCYDGYTLRGSANRTCQVNG
#  ## RWSGQTAICDNGAGYCSNPGIPIGTRKVGSQYRLEDSVTYHCSRGLTLRGSQRRTCQEGGSWSGTEPSCQDSFMYDT
#  ## PQEVAEAFLSSLTETIEGVDAEDGHGPGEQQKRKIVLDPSGSMNIYLVLDGSDSIGASNFTGAKKCLVNLIEKVASY
#  ## GVKPRYGLVTYATYPKIWVKVSEADSSNADWVTKQLNEINYEDHKLKSGTNTKKALQAVYSMMSWPDDVPPEGWNRT
#  ## RHVIILMTDGLHNMGGDPITVIDEIRDLLYIGKDRKNPREDYLDVYVFGVGPLVNQVNINALASKKDNEQHVFKVKD
#  ## MENLEDVFYQMIDESQSLSLCGMVWEHRKGTDYHKQPWQAKISVIRPSKGHESCMGAVVSEYFVLTAAHCFTVDDKE
#  ## HSIKVSVGGEKRDLEIEVVLFHPNYNINGKKEAGIPEFYDYDVALIKLKNKLKYGQTIRPICLPCTEGTTRALRLPP
#  ## TTTCQQQKEELLPAQDIKALFVSEEEKKLTRKEVYIKNGDKKGSCERDAQYAPGYDKVKDISEVVTPRFLCTGGVSP
#  ## YADPNTCRGDSGGPLIVHKRSRFIQVGVISWGVVDVCKNQKRQKQVPAHARDFHINLFQVLPWLKEKLQDEDLGFL"
#  ##
#  ## [[3]]
#  ## [1] "APPIQSRIIGGRECEKNSHPWQVAIYHYSSFQCGGVLVNPKWVLTAAHCKNDNYEVWLGRHNLFENENTAQF
#  ## FGVTADFPHPGFNLSLLKXHTKADGKDYSHDLMLLRLQSPAKITDAVKVLELPTQEPELGSTCEASGWGSIEPGPDB
#  ## FEFPDEIQCVQLTLLQNTFCABAHPBKVTESMLCAGYLPGGKDTCMGDSGGPLICNGMWQGITSWGHTPCGSANKPS
#  ## IYTKLIFYLDWINDTITENP"

## ---- protcheck----------------------------------------------------------
x = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
# a real sequence
protcheck(x)
# an artificial sequence
protcheck(paste(x, "Z", sep = ""))

## ---- protseg------------------------------------------------------------
protseg(x, aa = "M", k = 5)

